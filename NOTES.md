Currently
---------
* Even on errors, populate form and results
* loading spinner not always show when clicking on friend sidebar links (image not yet loaded? try adding text too)
* CSS color on private profile not working
* Switch back to pageheader instead of title, so browser history has titles when AJAX loading page headers
* What happens when there's no friends?
* Create Rails helper to query SteamId by id or string
* load friends list from initial root page load search
* Convert achievement loading to js.erb
* Reload friend and achievement data via AJAX on friend list click

Bugs
----

Next
----
* Split achievement loading into separate load and render functions to DRY form submission and permalink loading
* Put Steam profile pic in sidebar
* Check for no unlocked achievements
* Add achievement images

More
----
* Format flash messages better (as drop downs and triggered from layout)
* Show completion percentage (bar?)
* OpenID Steam connect instead of Twitter (then connect to Twitter from settings)
* Tweet new achievements (associate Twitter account)
* Find out which of your friends has the most achievements
* Do I have this achievement?, when looking at someone else's list
* Compare achievements to a friend
* Icon to indicate if you've unlocked an achievement when you're looking at other people's
* Sidebar blog widget (with caching)
* Class based drop down (for TF2 only?)

Research
--------

Global achievement unlock percentages for all achievements per game (uses achievement API name)
http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/?gameid=440&format=xml

Last time played (among other things)
http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=XXXXXXXXXXXXXXXXXXXXXXX&steamids=76561197960435530
