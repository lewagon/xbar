# Setup

Install Bitbar:

```bash
brew cask install bitbar
```

Clone this repo on your laptop then set the plugin as executable:

```bash
mkdir -p ~/code/lewagon
gh repo clone lewagon/bitbar
cd bitbar
chmod a+x ticket.10s.rb
```

Launch the Bitbar app and choose `~/code/lewagon/bitbar` as **Plugin Folder**

## Configuration

Open the `~/code/lewagon/bitbar/ticket.10s.rb` file and make sure to change line `12`:

```ruby
BATCH_SLUG = 501
```
