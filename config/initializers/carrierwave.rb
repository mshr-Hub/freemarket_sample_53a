require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.staging?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      region: 'ap-northeast-1',
      aws_access_key_id: Rails.application.credentials.aws_access_key_id,
      aws_secret_access_key: Rails.application.credentials.aws_secret_access_key,
    }
    config.fog_directory  = Rails.env.production? ? 'freemarket-sample-53a-mshr' : 'stg-freemarket-sample-53a'
    config.asset_host = "https://#{config.fog_directory}.s3-ap-northeast-1.amazonaws.com"
  else
    config.storage = :file
    config.asset_host = "http://localhost:3000"
  end
end