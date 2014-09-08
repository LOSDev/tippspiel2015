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

  url = window.location.href
  split_url = url.replace('http://', '').split('/');

  if (split_url[2] == "matchday")
    $( ".nav-pills li:nth-child(2)" ).addClass("active")
  
  if (split_url[2] == "overall")
    $( ".nav-pills li:nth-child(1)" ).addClass("active")

  if (split_url[2] == "tipp_group")
    $( ".nav-pills li:nth-child(3)" ).addClass("active")

  if(split_url[1] == "rankings")
    $( ".navbar-nav li:nth-child(2)" ).addClass("active")
  
  if(split_url[1] == "regeln")
    $( ".navbar-nav li:nth-child(3)" ).addClass("active")
  
  if(split_url[1] == "tipps") 
    $( ".navbar-nav li:nth-child(1)" ).addClass("active")

#redirecting after Tipp-Group has been selected
  $('#tipp-group-select').change(->
    window.location.href = "/rankings/tipp_group/" + $(this).val()
    )
  