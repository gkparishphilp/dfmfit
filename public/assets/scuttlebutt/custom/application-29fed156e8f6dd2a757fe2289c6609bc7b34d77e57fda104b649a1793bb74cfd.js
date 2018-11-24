(function() {
  $(document).ready(function() {
    var comment_widget_url, comment_widgets, subscription_widget_url, subscription_widgets, vote_widget_url, vote_widgets;
    comment_widgets = [];
    comment_widget_url = null;
    $('.has_current_user .scuttlebutt_comments_widget').each(function() {
      comment_widget_url || (comment_widget_url = $(this).data('url').split("?")[0]);
      return comment_widgets.push($(this).data('params'));
    });
    if (comment_widgets.length > 0) {
      $.getScript(comment_widget_url + "?" + jQuery.param({
        comment_widgets: comment_widgets
      }));
    }
    vote_widgets = [];
    vote_widget_url = null;
    $('.has_current_user .scuttlebutt_votes_widget').each(function() {
      vote_widget_url || (vote_widget_url = $(this).data('url').split("?")[0]);
      return vote_widgets.push($(this).data('params'));
    });
    if (vote_widgets.length > 0) {
      $.getScript(vote_widget_url + "?" + jQuery.param({
        vote_widgets: vote_widgets
      }));
    }
    subscription_widgets = [];
    subscription_widget_url = null;
    $('.has_current_user .scuttlebutt_subscriptions_widget').each(function() {
      subscription_widget_url || (subscription_widget_url = $(this).data('url').split("?")[0]);
      return subscription_widgets.push($(this).data('params'));
    });
    if (subscription_widgets.length > 0) {
      return $.getScript(subscription_widget_url + "?" + jQuery.param({
        subscription_widgets: subscription_widgets
      }));
    }
  });

}).call(this);
