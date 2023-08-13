#!/usr/bin/env ruby

# <xbar.title>Help - Triage</xbar.title>
# <xbar.version>v1.1</xbar.version>
# <xbar.author>Sébastien Saunier</xbar.author>
# <xbar.author.github>ssaunier</xbar.author.github>
# <xbar.desc>List GitHub Issues from lewagon/help who needs triage</xbar.desc>
# <xbar.image>https://kitt.lewagon.com/slack/slack-bot-logo.png</xbar.image>
# <xbar.dependencies>Ruby</xbar.dependencies>

require "octokit"
require "yaml"

QUERY = "repo:lewagon/help state:open label:triage"

class Plugin
  def initialize
    token = `/usr/local/bin/gh auth token`
    client = Octokit::Client.new(access_token: token)
    @issues = client.search_issues(QUERY)
  end

  def show(issue)
    "##{issue.number} - @#{issue.user.login} - #{issue.title}"
  end

  def emoji
    @issues.total_count.zero? ? "✓" : "🚩"
  end

  def issues
    @issues.items
  end

  def count
    return nil if @issues.total_count.zero?

    @issues.total_count
  end
end


plugin = Plugin.new
puts [plugin.emoji, plugin.count].compact.join(" ")
puts "---"
plugin.issues.each do |issue|
  puts "#{plugin.show(issue).gsub("|", "")}|href=#{issue.html_url}"
end
