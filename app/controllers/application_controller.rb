class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # http_basic_authenticate_with name: ENV['auth_name'], password: ENV['auth_pass']
end
