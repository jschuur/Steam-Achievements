Steam Achievements
==================

A Rails app for browsing unlocked game achievements on the [Steam](http:/steamgames.com) multiplayer platform. See [sample output](http://by.joostschuur.com/steam/a/jschuur/tf2).

Developed by [Joost Schuur](http://joostschuur.com).

Steam Community Information
---------------------------

[Steam Web API](http://developer.valvesoftware.com/wiki/Steam_Web_API) key via http://steamcommunity.com/dev. Some [Steam Community Data](https://partner.steamgames.com/documentation/community_data) also available via another, unauthenticated API.

Access to Steam Community data via [steam-condenser gem](https://github.com/koraktor/steam-condenser/).

Global achievement unlock percentages for all achievements per game (uses achievement API name)
http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/?gameid=440&format=xml

Last time played (among other things)
http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=XXXXXXXXXXXXXXXXXXXXXXX&steamids=76561197960435530

Todo
----

* Format flash messages better (as drop downs and triggered from layout)
* Show completion percentage (bar?)
* OpenID Steam connect instead of Twitter (then connect to Twitter from settings)
* Tweet new achievements (associate Twitter account)
* Add player avatar to results page
* Add achievement images
* Find out which of your friends has the most achievements
* Compare achievements to a friend
* Sidebar blog widget (with caching)
* Class based drop down (for TF2 only?)

Bugs
----

* Check for non-existant username
* Check for no unlocked achievements