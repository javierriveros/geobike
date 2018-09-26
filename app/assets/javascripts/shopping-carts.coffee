$(document).on 'ajax:success', '#add-to-cart', (e, data, status, xhr)->
  $("#cart-size").text(parseInt($("#cart-size").text()) + 1)
$(document).on 'ajax:success', '#add-to-cart', (e, data, status, xhr)->
  console.log 'error'