class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!
  load_and_authorize_resource
end
