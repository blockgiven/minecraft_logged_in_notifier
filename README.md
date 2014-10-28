# Minecraft logged in notifier

minecraft logged in notifier for idobata.io

## Usage

    $ hub clone blockgiven/minecraft_logged_in_notifier
    $ cd minecraft_logged_in_notifier
    $ heroku create minecraft-logged-in-notifier
    $ heroku config:set IDOBATA_HOOK_URL=<YOUR_IDOBATA_HOOK_URL>
    $ heroku config:set MINECRAFT_SERVER_ADDRESS=<YOUR_MINECRAFT_SERVER_ADDRESS>
    $ heroku addons:add redistogo
    $ git push heroku master
    $ heroku ps:scale notify=1
