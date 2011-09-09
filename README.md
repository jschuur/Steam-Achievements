Steam Achievements
==================

A Rails app for browsing unlocked game achievements on the [Steam](http:/steamgames.com) multiplayer platform. See [sample output](http://by.joostschuur.com/steam/jschuur/tf2).

Developed by [Joost Schuur](http://joostschuur.com).

Steam Community Information
---------------------------

[Steam Web API](http://developer.valvesoftware.com/wiki/Steam_Web_API) key via http://steamcommunity.com/dev. Some [Steam Community Data](https://partner.steamgames.com/documentation/community_data) also available via another, unauthenticated API.

Access to Steam Community data via [steam-condenser gem](https://github.com/koraktor/steam-condenser/).

Todo
----

* Format flash messages better
* No flash on successful signup?
* Show completion percentage (bar?)
* Tweet new achievements (associate Twitter account)
* Add player avatar to results page
* Add achievement images
* Lookup Steam ID from Steam username?
* Compare achievements to a friend
* Sidebar blog widget (with caching)
* Class based drop down (for TF2 only?)

Bugs
----

* Check for non-existant username
* Check for no unlocked achievements