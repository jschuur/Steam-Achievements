popped = ("state" of window.history)
initialURL = location.href
current_game = null
current_user = null

# So we can create global functions later
root = exports ? this

root.load_achievements = (user, game) ->
  current_game = game
  $("#errors").empty()
  $("#results").empty()
  $("#spinner").show()
  $("#lookup #user").val user
  $("#lookup #game").val game
  $.getScript('/a/' + user + '/' + game + '.js')
    
root.load_friends = (user) ->
  current_user = user
  $("#friendslist").show()
  $("#sidebar h3:first").html('Friends')
  $("#friends").html('Loading...')
  $.getScript('/friends/' + user + '.js')

$ ->
  $("#lookup").bind("ajax:before", (evt, xhr, settings) ->
    $("#errors").empty()
    $("#results").empty()
    $("#spinner").show()
    unless $("#lookup input[name=user]").val() == current_user
      load_friends $("#lookup input[name=user]").val()
  ).bind("ajax:success", (data) ->
    current_game = $("#lookup select[name=game]").val()
    current_user = $("#lookup input[name=user]").val()
  )

  $(".friendlink").live('click', (e) ->
    user = $(this).attr('data-user')
    load_friends user
    load_achievements user, current_game

    e.preventDefault()
  )

  $(window).bind "popstate", ->
    initialPop = not popped and location.href == initialURL
    popped = true
    return if initialPop

    currentURL = location.href
    unless currentURL.indexOf("/a/") == -1
      fragments = currentURL.split('/')
      game = fragments[fragments.length - 1]
      user = fragments[fragments.length - 2]

      load_achievements user, game
      load_friends user

      $("#lookup #user").val user
      $("#lookup #game").val game      
    else
      $("#results").empty()
      $("#errors").empty()
      $("#lookup #user").val ""
      $("#lookup #game").eq 0
      $("#friendslist").hide()
      $("#friends").empty()