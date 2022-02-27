# frozen_string_literal: true

require "google/cloud/storage"

PROJECT_ID = "mdcurran"
WEBSITE_DOMAIN = "#{PROJECT_ID}.xyz"

storage = Google::Cloud::Storage.new(
  project_id: PROJECT_ID,
)

bucket = storage.bucket WEBSITE_DOMAIN

files = ["index.html", "404.html", "style.css"].freeze
files.each do |file|
  bucket.create_file "./#{file}", file
end
