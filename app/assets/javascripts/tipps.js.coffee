# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".has-error").parent('div').addClass("has-error")

#adding active class to matchday 
  $(".btn-group-justified .btn").removeClass("active")
  value = $("#matchday").val()
  
  $("#matchday#{value}").addClass("active")

#Setting active Class based on URL
  if (window.location.href.indexOf("matchday") > -1)
    $( ".nav-pills li:nth-child(2)" ).addClass("active")
  
  if (window.location.href.indexOf("overall") > -1)
    $( ".nav-pills li:nth-child(1)" ).addClass("active")

  if (window.location.href.indexOf("tipp_group") > -1)
    $( ".nav-pills li:nth-child(3)" ).addClass("active")

  if (window.location.href.indexOf("rankings") > -1)
    $( ".navbar-nav li:nth-child(2)" ).addClass("active")
  
  if (window.location.href.indexOf("regeln") > -1)
    $( ".navbar-nav li:nth-child(3)" ).addClass("active")
  
  if (window.location.href.indexOf("tipps") > -1)
    $( ".navbar-nav li:nth-child(1)" ).addClass("active")

#redirecting after Tipp-Group has been selected
  $('#tipp-group-select').change(->
    window.location.href = "/rankings/tipp_group/" + $(this).val()
    )
  