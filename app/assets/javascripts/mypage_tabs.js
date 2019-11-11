$(function() {

  $(document).on('turbolinks:load', function(e) {

    // お知らせタブ
    var notification_tab = $('#notification_tab');
    // お知らせ内容
    var notification_content = $('#notification_content');

    // やることリストタブ
    var todo_tab = $('#todo_tab');
    // やることリスト内容
    var todo_content = $('#todo_content');

    // 取引中タブ
    var trade_now_tab = $('#trade_now_tab');
    // 取引中内容
    var trade_now_content = $('#trade_now_content');

    // 過去の取引タブ
    var trade_old_tab = $('#trade_old_tab');
    // 過去の取引内容
    var trade_old_content = $('#trade_old_content');


    // 画面ロード時にはお知らせと取引中をアクティブに
    notification_tab.addClass('active');
    notification_content.addClass('active');
    trade_now_tab.addClass('active');
    trade_now_content.addClass('active');

    // お知らせタブのクリック時にお知らせ部分をアクティブに
    notification_tab.on('click', function() {
      notification_tab.addClass('active');
      notification_content.addClass('active');
      todo_tab.removeClass('active');
      todo_content.removeClass('active');
    });

    // やることタブをクリック時にやることリスト部分をアクティブに
    todo_tab.on('click', function() {
      todo_tab.addClass('active');
      todo_content.addClass('active');
      notification_tab.removeClass('active');
      notification_content.removeClass('active');
    });

    // 取引中タブをクリック時に取引中部分をアクティブに
    trade_now_tab.on('click', function() {
      trade_now_tab.addClass('active');
      trade_now_content.addClass('active');
      trade_old_tab.removeClass('active');
      trade_old_content.removeClass('active');
    });

    // 過去の取引タブをクリック時に過去の取引部分をアクティブに
    trade_old_tab.on('click', function() {
      trade_old_tab.addClass('active');
      trade_old_content.addClass('active');
      trade_now_tab.removeClass('active');
      trade_now_content.removeClass('active');
    });

  });

});