// Prevent Chrome from reacting to popstate on page load (such bullshit)
var popped = ('state' in window.history), initialURL = location.href

function load_achievements(url) {
  $.get(url)
    .success(function(data) {
      $("#spinner").hide()
      response = jQuery.parseJSON(data)
      $('#results').html(response.results)
      $('#results').show()
      $("#lookup #user").val(response.user)
      $("#lookup #game").val(response.game)
    })
    .error(function() { 
      alert("Error loading achievements from Steam"); 
    })
}

$(function() {
  $("#lookup")
    .bind("ajax:before", function(evt, xhr, settings) {
      $("#results").hide()
      $("#spinner").show()
    })
    .bind("ajax:complete", function(xhr, status) {
      $("#spinner").hide()
    })
    .bind("ajax:success", function(evt, data, status, xhr) {
      response = jQuery.parseJSON(xhr.responseText)
      $('#results').html(response.results)
      $('#results').show()
      history.pushState(null, response.title,  response.achievements_path)
    })
    
    $(window).bind("popstate", function () {
      var initialPop = !popped && location.href == initialURL
      popped = true
      if ( initialPop ) return
      
      if ( location.href.indexOf('/a/') != -1 ) {
        load_achievements(location.href)
      } else  {
        $("#results").empty()
        $("#lookup #user").val('')
        $("#lookup #game").eq(0)
      }
    });
})