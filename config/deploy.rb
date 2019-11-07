# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.11.0'

# Capistranoのログの表示に利用する
# set :application, 'freemarket_sample_53a'

# どのリポジトリからアプリをpullするかを指定する
# 自分のリポジトリに修正
set :repo_url,  'git@github.com:mshr-Hub/freemarket_sample_53a.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1' #rubyのバージョン

# どの公開鍵を利用してデプロイするか
# set :ssh_options, auth_methods: ['publickey'],
#                   keys: ['~/.ssh/freemarket_sample_53a.pem']

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# master.keyのアップロード
# from https://github.com/capistrano/rails
append :linked_files, "config/master.key"
namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
end

# mysqlの再起動を実施
before 'deploy:migrate', 'mysql:restart'
namespace :mysql do
  task :restart do
    on roles(:db) do
      execute "sudo service mysqld restart"
    end
  end
end

# db作成
before 'deploy:migrate', 'db:create'
namespace :db do
  task :create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
end

# db削除（DB削除したいときに利用）
namespace :db do
  task :drop do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:drop'
        end
      end
    end
  end
end

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end
