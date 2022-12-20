# Setup

Install [xbar](https://github.com/matryer/xbar):

```bash
brew install xbar
```

## Ticket Monitor

To enable this plugin:

```bash
cd ~/code/lewagon/xbar
vim ticket.10s.rb # Change the `BATCH_SLUG` variable!

chmod a+x ticket.10s.rb
ln -s "`pwd`/ticket.10s.rb" ~/Library/Application\ Support/xbar/plugins/ticket.10s.rb
```

Then in xbar, `Refresh all` and wait a few seconds.

## Help - Triage

Get [lewagon/help (Triage)](https://github.com/lewagon/help/labels/triage) directly into your macOS Toolbar!

```bash
cd ~/code/lewagon/xbar
rbenv local system
sudo gem install octokit -v 4.25.1
sudo gem install faraday-retry

chmod a+x triage.5m.rb
ln -s "`pwd`/triage.5m.rb" ~/Library/Application\ Support/xbar/plugins/triage.5m.rb
```
