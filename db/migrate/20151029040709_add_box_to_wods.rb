class AddBoxToWods < ActiveRecord::Migration
  def change
    add_reference :wods, :box, index: true, foreign_key: true
  end
end
