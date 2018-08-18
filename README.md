# PlanningCenterDemo
A simple Rails application showing the capabilities of the Planning Center API Ruby Gem.

# Description
This application provides a simple interface to see all the songs for a given church account and view the arrangements and attachments for each song. 
Animate.css is used for some page transitions and Redis is used to cache the initial song list API response to boost performance.

Please see PlanningCenterDemo.mp4 for a video demonstration.

# Installation
1. In order to run, a Redis server must be configured and be running on the machine. Here are some articles to help with this process.

    Windows 10: https://medium.com/@Renyxz/how-to-install-redis-4-0-9-on-windows-10-details-d130ef4aaa08

    Mac OS X: https://medium.com/@petehouston/install-and-config-redis-on-mac-os-x-via-homebrew-eb8df9a4f298

2. A Planning Center API Key/Secret must be set in PlanningCenterDemo\config\environments\development.rb

    Note: The user that the key/secret is created for must have Viewer permissions or higher in PCO.
```
 config.pco_api_key='YOUR KEY'
 config.pco_api_secret='YOUR SECRET'
```
