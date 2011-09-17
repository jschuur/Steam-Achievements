popped = ("state" of window.history)
initialURL = location.href

# So we can create global functions later
root = exports ? this

root.load_achievements = (url) ->
  $("#spinner").show()
  $.get(url).success((data) ->
    $("#spinner").hide()
    response = jQuery.parseJSON(data)
    $("#results").html response.results
    $("#results").show()
    $("#lookup #user").val response.user
    $("#lookup #game").val response.game
  ).error ->
    alert "Error loading achievements from Steam"

$ ->
  $("#lookup").bind("ajax:before", (evt, xhr, settings) ->
    $("#results").hide()
    $("#spinner").show()
  ).bind("ajax:complete", (xhr, status) ->
    $("#spinner").hide()
  ).bind "ajax:success", (evt, data, status, xhr) ->
    response = jQuery.parseJSON(xhr.responseText)
    $("#results").html response.results
    $("#results").show()
    history.pushState null, response.title, response.achievements_path
  
  $(window).bind "popstate", ->
    initialPop = not popped and location.href == initialURL
    popped = true
    return if initialPop
    unless location.href.indexOf("/a/") == -1
      load_achievements location.href
    else
      $("#results").empty()
      $("#lookup #user").val ""
      $("#lookup #game").eq 0