#!/usr/bin/env ruby

require 'thor'

class HerokuPowercli < Thor

  desc "remove_many EMAIL", "Remove collaborator from all projects"
  option :token, required: true
  def remove_many(email)
    require 'platform-api'
    heroku = PlatformAPI.connect_oauth(options[:token])
    heroku.app.list.each do |app|
      $stderr.puts "Checking #{app['name']}..."
      heroku.collaborator.list(app['name']).each do |collaborator|
        next unless collaborator['user']['email'] == email
        $stderr.puts "...removing #{email}"
        heroku.collaborator.delete(app['name'], email)
      end
    end
  end
end

HerokuPowercli.start(ARGV)
