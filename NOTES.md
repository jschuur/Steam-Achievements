Currently
---------
* Even on errors, populate form and results
* loading spinner not always show when clicking on friend sidebar links (image not yet loaded? try adding text too)
* Switch back to pageheader instead of title, so browser history has titles when AJAX loading page headers
* What happens when there's no friends?
* load friends list from initial root page load search
* Check for valid game with new APP_CONFIG['games'] format

Bugs
----
* CSS color on private profile not working
* Dropdowns don't load on about page because JS files are included twice
* steam privacy state not properly set for authenticated users
* Add right padding to main content column
* Problem with loading permalink with numeric IDs? http://steam.dev/a/76561197970679651/tf2 Not easily repeatable
* No loading spinner for sidebar links?
* Can't go forward after you've gone back
* undefined method nickname error (go to http://steam.dev/a/jschuur/l4d and select recurve7) Problem with square brackets?

Next
----
* noscript tags for when JavaScript is disabled.
* Helper for 'use id or custom_url; Apply to Settings page link.
* deal with more than 100 friends (multiple API calls)
* Split achievement loading into separate load and render functions to DRY form submission and permalink loading
* Put Steam profile pic in sidebar (still, now that it's next to dropdown?)
* Add Twitter account via settings
* Checkboxes for 'Tweet new achievements' and 'Get daily summary email'
* Check for no unlocked achievements
* Add achievement images

More
----
* Format flash messages better (as drop downs and triggered from layout)
* Show completion percentage (bar?)
* Tweet new achievements (associate Twitter account)
* Find out which of your friends has the most achievements
* Do I have this achievement?, when looking at someone else's list
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
