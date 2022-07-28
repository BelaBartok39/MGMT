class TemplatesController < ApplicationController
  def index
    @templates = current_user.templates
  end
end
