class PagesController < ApplicationController
  before_action :authorized, except: %i[index]

  def index
  end
end
