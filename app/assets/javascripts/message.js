$(document).on('turbolinks:load', function(){
// $(function(){

  // 新規コメント表示用
  function new_message(message_data){
    var html = `
    <div class="comment_Me comment_one_block" data-index="${message_data.message_id}">
      <li class="message-self">
        <div class="comment_user_name">
          ${message_data.user_nickname}
        </div>
        <div class="message-body">
          <div class="message-body-text">
            ${message_data.message}
            <div class="message-icons">
              ${message_data.created_at}
            </div>
          </div>
        </div>
        <div class="comment_delete me_pre_delete" data-index="${message_data.message_id}" data-item="${message_data.item_id}">
          <a rel="nofollow" data-method="patch" href="/items/${message_data.item_id}/messages/${message_data.message_id}">削除する</a>
        </div>
      </li>
    </div>
    `
    return html;
  }
  
  function new_message_other(message_data){
    var html = `
    <div class="comment_Me comment_one_block" data-index="${message_data.message_id}">
      <li class="message-self">
        <div class="comment_user_name">
          ${message_data.user_nickname}
        </div>
        <div class="message-body">
          <div class="message-body-text">
            ${message_data.message}
            <div class="message-icons">
              ${message_data.created_at}
            </div>
          </div>
        </div>
      </li>
    </div>
    `
    return html;
  }
  

  // 仮削除表示用
  function OtherPreDelete(index, item){
    var html = `
        <div class="message-body-other">
          <div class="message-body-text">
            出品者によりこのコメントは削除されました。
          </div>
        </div>
        <div class="comment_restore" data-index="${index}" data-item="${item}">
          <a href="/items/${item}/messages/${index}/restore">復元する</a>
        </div>
        <div class="comment_delete complete_delete" data-index="${index}" data-item="${item}">
          <a rel="nofollow" data-method="delete" href="/items/${item}/messages/${index}">削除する</a>
        </div>
    `
  return html;
  }

  function MePreDelete(index, item){
    var html = `
        <div class="message-body">
          <div class="message-body-text">
            出品者によりこのコメントは削除されました。
          </div>
        </div>
        <div class="comment_restore" data-index="${index}" data-item="${item}">
          <a href="/items/${item}/messages/${index}/restore">復元する</a>
        </div>
        <div class="comment_delete complete_delete" data-index="${index}" data-item="${item}">
          <a rel="nofollow" data-method="delete" href="/items/${item}/messages/${index}">削除する</a>
        </div>
    `
  return html;
  }

  
  // 復元
  function restoreMe(restore_data){
    var html = `
          <div class="comment_user_name">
            ${restore_data.user_nickname}
          </div>
          <div class="message-body">
            <div class="message-body-text">
              ${restore_data.message}
              <div class="message-icons">
                ${restore_data.created_at}
              </div>
            </div>
          </div>
          <div class="comment_delete me_pre_delete" data-index="${restore_data.message_id}" data-item="${restore_data.item_id}">
            <a rel="nofollow" data-method="patch" href="/items/${restore_data.item_id}/messages/${restore_data.message_id}">削除する</a>
          </div>
      `
      return html;
  }

  function restoreOther(restore_data){
    var html = `
          <div class="comment_user_name_other">
            ${restore_data.user_nickname}
          </div>
          <div class="message-body-other">
            <div class="message-body-text">
              ${restore_data.message}
              <div class="message-icons">
                ${restore_data.created_at}
              </div>
            </div>
          </div>
          <div class="comment_delete me_pre_delete" data-index="${restore_data.message_id}" data-item="${restore_data.item_id}">
            <a rel="nofollow" data-method="patch" href="/items/${restore_data.item_id}/messages/${restore_data.message_id}">削除する</a>
          </div>
      `
      return html;
  }


  
  
  // コメント作成した場合
  $('.massage-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message_data){
      if (message_data.item_seller.id == message_data.user_id){  // 出品者とコメントしたユーザーが等しい場合
        var html = new_message(message_data);
        $(".message-items").append(html);
        $('#comment_body').val('');
        $('.message-submit').prop('disabled', false);
      } else {  // 出品者とコメントしたユーザーが異なる場合
        var html = new_message_other(message_data);
        $(".message-items").append(html);
        $('#comment_body').val('');
        $('.message-submit').prop('disabled', false);
      }
    
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });

  

  

  // 他人のコメントを仮削除した場合
  $(".message-items").on('click',".other_pre_delete",function(e){
    e.preventDefault()
    var index = $(this).data("index");
    var item = $(this).data("item");
    var content = $(`.comment_one_block[data-index=${index}]`).find(".message-self");
    content.empty();
    content.append(OtherPreDelete(index, item));
  });
  //自分のコメントを仮削除した場合
  $(".message-items").on('click',".me_pre_delete",function(e){
    e.preventDefault()
    var index = $(this).data("index");
    var item = $(this).data("item");
    var content =  $(`.comment_one_block[data-index=${index}]`).find(".message-self");
    content.empty();
    content.append(MePreDelete(index,item));
  });

  // // 完全削除した場合
  $(".message-items").on('click','.complete_delete',function(e){
    e.preventDefault()
    var index = $(this).data("index");
    $(`.comment_one_block[data-index=${index}]`).remove();
  });


  // 復元した場合
  $(".message-items").on('click',".comment_restore",function(e){
    e.preventDefault()
    var index = $(this).data("index");
    var item = $(this).data("item");
    var url =`/items/${item}/messages/${index}/restore`
    $.ajax({
      url: url,
      type: "GET",
      dataType: 'json',
    })
    .done(function(restore_data){
      if (restore_data.item_seller.id == restore_data.user_id){  // 出品者とコメントしたユーザーが等しい場合
        var html = restoreMe(restore_data);
        var content = $(`.comment_one_block[data-index=${index}]`).find(".message-self");
        content.empty();
        content.append(html);
      } else {   // 出品者とコメントしたユーザーが異なる場合
        var html = restoreOther(restore_data);
        var content = $(`.comment_one_block[data-index=${index}]`).find(".message-self");
        content.empty();
        content.append(html);
      }
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });
})

