App.comments = App.cable.subscriptions.create("CommentsChannel", {
  connected: function () {},
  disconnected: function () {},
  received: function (data) {
    var id = data.post.id;
    var $post = $('.post[data-id=' + id + ']');
    if ($post) {
      $post.find('.post__comments')
        .append(data.comment);
      $post.find('.comment__form input')
        .val('');
    }
  }
});