# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> 
  calcJson = ->
    alert('実績を入力してください。') if $('input.seisan_hour').val() == ''
    $.getJSON "/api/calc", { seisan_hour: $('input.seisan_hour').val(), current_time: $('label.current-time').text(), salaried: $('input.salaried').val() }, (json) ->
      $('label.reminning-work-time').text(json['rest_hour'])
      $('label.reminning-work-day').text(json['rest_workday'])

  $('input.seisan_hour').on 'change', -> calcJson()
  $('input.salaried').on 'change', -> calcJson()
