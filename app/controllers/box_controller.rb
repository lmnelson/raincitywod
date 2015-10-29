class BoxController < ApplicationController
  def show
    @boxes = Box.all()
    @box = Box.find(params[:id])
    @wod = @box.wods.all().order(id: :desc)
  end
end
