$( document ).ready(function() {
  let modal_triggered = false;
  return $( window ).scroll(function() {
    const height = $(window).scrollTop();
    if ((height > 500) && !( modal_triggered )) {
      modal_triggered = true;
      return $('#promo').modal();
    }
  });
}); //modal trigger
