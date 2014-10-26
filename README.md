# Minecraft logged in notifier

minecraft logged in notifier for idobata.io

## Usage

    $ heroku create minecraft-logged-in-notifier
    $ heroku config:set IDOBATA_HOOK_URL=<YOUR_IDOBATA_HOOK_URL>
    $ heroku config:set MINECRAFT_SERVER_ADDRESS=<YOUR_MINECRAFT_SERVER_ADDRESS>
    $ heroku addons:add redistogo
    $ heroku addons:add scheduler
    $ heroku addons:open scheduler

Add job every 10 minuites:

    bundle exec ruby notifier.rb
