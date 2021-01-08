# Setup

## Fork and clone this repo

Fork [`lewagon/bitbar`](https://github.com/lewagon/bitbar) to your own GitHub account and clone it on your computer:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
cd ~/code/GITHUB_USERNAME
gh repo clone bitbar
```

Then make the `ticket.10s.rb` file executable:

```bash
cd ~/code/GITHUB_USERNAME/bitbar
chmod a+x ticket.10s.rb
```

## Set up your script bar client

### macOS

Install Bitbar:

```bash
brew cask install bitbar
```

Then launch the Bitbar app and choose `~/code/GITHUB_USERNAME/bitbar` as **Plugin Folder**

### linux

The equivalent of Bitbar for Linux is [Argos](https://github.com/p-e-w/argos).To install it go to [the GNOME extension page](https://extensions.gnome.org/extension/1176/argos/) and turn on the installation toggle.

`Argos` monitors the `~/.config/argos` folder to look for scripts to execute. Remove the default `argos.sh` script there and link the `ticket.10s.rb` file to this folder:

```bash
rm ~/.config/argos/argos.sh
ln -s ~/code/GITHUB_USERNAME/bitbar/ticket.10s.rb ~/.config/argos/ticket.10s.rb
```

### Configure your script

Open the `~/code/GITHUB_USERNAME/bitbar/ticket.10s.rb` file and make sure to change line `12`:

```ruby
BATCH_SLUG = 501
```
