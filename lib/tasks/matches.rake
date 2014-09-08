require "#{Rails.root}/lib/tasks/task_helper"
require 'open-uri'

namespace :matches do

  desc "load matches data"
  task :download => :environment do
    start_time = Time.now
    include HelperFunctions
    p "Downloading and Updating Matches"
    HelperFunctions::download_matches
    end_time = Time.now
    p end_time - start_time

  end
end



