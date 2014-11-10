################################################################################
# Copyright <%= config[:year] %> spriteCloud B.V. All rights reserved.
# Generated by LapisLazuli, version <%= config[:lapis_lazuli][:version] %>
# Author: "<%= config[:user] %>" <<%= config[:email] %>>

require 'lapis_lazuli'
ll = LapisLazuli::LapisLazuli.instance

Given(/^I navigate to (.*) in (.*)$/) do |site,language|
  config = "#{site.downcase}.#{language.downcase}"
  if ll.has_env?(config)
    url = ll.env(config)
    ll.browser.goto url
  else
    ll.error(:env => config)
  end
end

Given(/^I search for "(.*?)"$/) do |query|
  searchbox = ll.browser.find(:text_field => {:name => "q"})
  searchbox.clear rescue ll.log.debug "Could not clear searchbox"
  searchbox.send_keys(query)
end