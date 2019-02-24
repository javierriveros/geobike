@showAlert = (type, title, message)->
  template = "<div class='alert alert-#{type}' role='alert' id='alert'>
                <div class='container'>
                  <div class='alert-icon'>
                    <i class='material-icons'>check</i>
                  </div>
                  <button type='button' aria-label='Close' aria-hidden='true' class='close' data-dismiss='alert'>
                    <i class='material-icons'>close</i>
                  </button>
                  <strong>#{title}:</strong>
                  #{message}
                </div>
              </div>"
  $('body').append(template)
  $('body > #alert').not('.alert-important').delay(2000).fadeOut(350)

$(document).on 'ajax:success', '#add-to-cart', (e)->
  [data, status, xhr] = e.detail
  $("#cart-size").text(parseInt($("#cart-size").text()) + 1)
  showAlert("success", "Producto agregado", data.message)
$(document).on 'ajax:error', '#add-to-cart', (e)->
  [data, status, xhr] = e.detail
  showAlert("danger", "Error", data.message)