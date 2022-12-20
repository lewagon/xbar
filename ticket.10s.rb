#!/usr/bin/env ruby

# <xbar.title>Kitt Tickets</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Sébastien Saunier</xbar.author>
# <xbar.author.github>ssaunier</xbar.author.github>
# <xbar.desc>Monitor Ticket Queue for a Batch</xbar.desc>
# <xbar.image>https://kitt.lewagon.com/slack/slack-bot-logo.png</xbar.image>
# <xbar.dependencies>Ruby</xbar.dependencies>

## CONFIGURATION
BATCH_SLUG = 1000

## SCRIPT
require 'net/http'
require 'json'

class Plugin
  attr_reader :slug

  def initialize(slug)
    @slug = slug
    url = URI("https://kitt.lewagon.com/api/v1/camps/#{@slug}/color")
    @status = JSON.parse(Net::HTTP.get(url))
  end

  def count
    @status['count']
  end

  def tickets_url
    "https://kitt.lewagon.com/camps/#{@slug}/tickets"
  end

  def emoji
    return "🍕" if @status["lunch_break"]

    case @status["color"]
    when "red" then "😱"
    when "orange" then "😨"
    when "green" then "😇"
    else
      "😴"
    end
  end

  def color
    @status["color"] == "grey" ? "gray" : @status["color"]
  end
end

plugin = Plugin.new(BATCH_SLUG)
puts "#{[plugin.emoji, plugin.count].join(" ")}|color=#{plugin.color}"
puts "---"
puts "Go to Kitt - Tickets ##{plugin.slug}|href=#{plugin.tickets_url}"
