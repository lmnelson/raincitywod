class WodController < ApplicationController
  def index
    @wod = Wod.all().order(created_at: :desc)
  end
end
