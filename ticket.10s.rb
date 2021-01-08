#!/usr/bin/env ruby

BATCH_SLUG = 552

require 'net/http'
require 'json'

class Plugin
  def initialize(slug)
    @slug = slug
    url = URI("https://kitt.lewagon.com/api/v1/camps/#{@slug}/color")
    @status = JSON.parse(Net::HTTP.get(url))
  end

  def emoji
    return "🍕" if @status["lunch_break"]

    case @status["color"]
    when "red" then "🔴"
    when "orange" then "🟠"
    when "green" then "🟢"
    else
      "⚪"
    end
  end

  def count
    @status['count']
  end

  def display
    "#{@slug} #{emoji} #{count}"
  end
end

puts Plugin.new(BATCH_SLUG).display
