popped = ("state" of window.history)
initialURL = location.href

# So we can create global functions later
root = exports ? this

root.load_achievements = (url) ->
  $("#errors").empty()
  $("#results").empty()
  $("#spinner").show()
  $.getScript(url)
    
root.load_friends = (url) ->
  $("#friendslist").show()
  $("#sidebar h3:first").html('Friends');
  $("#friends").html('Loading...');
  $.getScript(url)

$ ->
  $("#lookup").bind("ajax:before", (evt, xhr, settings) ->
    $("#errors").empty()
    $("#results").empty()
    $("#spinner").show()
    load_friends('/friends/' + $("#lookup input[name=user]").val() + '.js')
  )

  $(window).bind "popstate", ->
    initialPop = not popped and location.href == initialURL
    popped = true
    return if initialPop

    currentURL = location.href
    unless currentURL.indexOf("/a/") == -1
      load_achievements currentURL
      fragments = currentURL.split('/')
      game = fragments[fragments.length - 1]
      user = fragments[fragments.length - 2]
      load_friends '/friends/' + user + '.js'
      $("#lookup #user").val user
      $("#lookup #game").val game      
    else
      $("#results").empty()
      $("#errors").empty()
      $("#lookup #user").val ""
      $("#lookup #game").eq 0
      $("#friendslist").hide()
      $("#friends").empty()