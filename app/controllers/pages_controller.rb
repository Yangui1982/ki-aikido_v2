class PagesController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!
  def about
  end

  def bibliographie
  end

  def dojo
  end

  def enseignement
  end

  def info
  end

  def media
  end
end
