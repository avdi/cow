jQuery ($) ->
  handleNewCowText = (text) ->
    $('#cow-view').text(text)

  updateCowText = ->
    return unless $('#new_cow_message').data('changed')

    message = $('#cow_message_message').val()
    cowfile = $('#cow_message_cowfile').val()
    params  = {message, cowfile}
    $.get '/cowsay', params, handleNewCowText, 'text'
    $('#new_cow_message').data('changed', false)

  $('#new_cow_message').change (event) ->
    $('#new_cow_message').data('changed', true)

  $('#new_cow_message').keyup (event) ->
    $('#new_cow_message').data('changed', true)

  setInterval(updateCowText, 1000)