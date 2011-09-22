Currently
---------
* Even on errors, populate form and results
* Switch back to pageheader instead of title, so browser history has titles when AJAX loading page headers
* Better error handling with new SteamProfile caching
* Better way to detect shared achievements (all ahead of time)
* List shared achievements tally in header
* Links (via CSS selectors) to show shared or non shared achievements only

Bugs
----
* CSS color on private profile not working
* Dropdowns don't load on about page because JS files are included twice
* Add right padding to main content column
* Can't go forward after you've gone back
* undefined method nickname error (go to http://steam.dev/a/jschuur/l4d and select recurve7) Problem with square brackets?
* Cached data doesn't return fact that user doesn't own the game.

Next
----
* noscript tags for when JavaScript is disabled.
* Put Steam profile pic in sidebar above friends list
* Check for no unlocked achievements
* Add achievement images
* Do I have this achievement?, when looking at someone else's list
* Non game specific users base page (just the sidebar and then what? Recent achievements across all games?)

More
----
* Checkboxes for 'Tweet new achievements' and 'Get daily summary email'
* Format flash messages better (as drop downs and triggered from layout)
* Show completion percentage (bar?)
* Tweet new achievements (associate Twitter account)
* Find out which of your friends has the most achievements
* Email summary of new achievements (including friends?)
* Compare achievements to a friend
* Icon to indicate if you've unlocked an achievement when you're looking at other people's
* Sidebar blog widget (with caching)
* Class based drop down (for TF2 only?)
* Weekly email also tells you what new Steam games your friends have been playing

Research
--------

Global achievement unlock percentages for all achievements per game (uses achievement API name)
http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/?gameid=440&format=xml

Last time played (among other things)
http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=XXXXXXXXXXXXXXXXXXXXXXX&steamids=76561197960435530
