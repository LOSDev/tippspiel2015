# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".has-error").parent('div').addClass("has-error")
  
  $(".btn-group-justified .btn").removeClass("active")
  value = $("#matchday").val()
  
  $("#matchday#{value}").addClass("active")

  if (window.location.href.indexOf("matchday") > -1)
    $( ".nav-pills li:nth-child(2)" ).addClass("active")
  
  if (window.location.href.indexOf("rankings") > -1)
    $( ".navbar-nav li:nth-child(3)" ).addClass("active")
  
  if (window.location.href.indexOf("regeln") > -1)
    $( ".navbar-nav li:nth-child(1)" ).addClass("active")
  
  if (window.location.href.indexOf("tipps") > -1)
    $( ".navbar-nav li:nth-child(2)" ).addClass("active")
  