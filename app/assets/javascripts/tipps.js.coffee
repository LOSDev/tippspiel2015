# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".has-error").parent('div').addClass("has-error")
  
  $(".btn-group-justified .btn").removeClass("active")
  value = $("#matchday").val()
  
  $("#matchday#{value}").addClass("active")

  
