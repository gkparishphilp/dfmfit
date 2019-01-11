
$( document ).ready ->
  modal_triggered = false
  $( window ).scroll ->
    height = $(window).scrollTop()
    if height > 500 && not( modal_triggered )
      modal_triggered = true
      $('#promo').modal() #modal trigger
    
