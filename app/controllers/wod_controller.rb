class WodController < ApplicationController
  def index
    @wod = Wod.all().order(id: :desc)
  end
end
