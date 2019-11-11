$(function() {

  $(document).on('turbolinks:load', function(e) {

    // 各ページへのリンクを取得
    var mypage_link = $('#mypage_link');
    var listing_link = $('#listing_link');
    var progress_link = $('#progress_link');
    var completed_link = $('#completed_link');
    var profile_link = $('#profile_link');
    var deliver_address_link = $('#deliver_address_link');
    var credit_card_link = $('#credit_card_link');
    var identification_link = $('#identification_link');
    var sign_out_link = $('#sign_out_link');

    // ユーザーを取得
    var user_id = $('.side').data('user-id');

    // 現在のパスによってリストのアクティブクラスを変更
    switch (location.pathname) {
      case `/users/${user_id}`:
        mypage_link.addClass('active');
        break
      case `/users/${user_id}/listings/listing`:
        listing_link.addClass('active');
        break
      case `/users/${user_id}/listings/in_progress`:
        progress_link.addClass('active');
        break
      case `/users/${user_id}/listings/completed`:
        completed_link.addClass('active');
        break
      case `/users/${user_id}/profile`:
        profile_link.addClass('active');
        break
      case `/users/${user_id}/deliver_address`:
        deliver_address_link.addClass('active');
        break
      case `/users/${user_id}/credit_card`:
        credit_card_link.addClass('active');
        break
      case `/users/${user_id}/credit_card/new`:
        credit_card_link.addClass('active');
        break
      case `/users/${user_id}/identification`:
        identification_link.addClass('active');
        break
      case `/sign_out`:
        sign_out_link.addClass('active');
        break
    }

  });
});