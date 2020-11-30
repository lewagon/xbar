# Setup

Download latest release of [Bitbar](https://github.com/matryer/bitbar/releases/latest) and put in your `/Applications` folder.

Clone the following repo on your laptop:

```bash
mkdir -p ~/code/lewagon
gh repo clone lewagon/bitbar
```

Then set the plugin as executable:

```bash
cd ~/code/lewagon/bitbar
chmod a+x ticket.10s.rb
```

Launch the Bitbar app and choose `~/code/lewagon/bitbar` as **Plugin Folder**

## Configuration

Open the `~/code/lewagon/ticket.10s.rb` file and make sure to change line `12`:

```ruby
BATCH_SLUG = 501
```
