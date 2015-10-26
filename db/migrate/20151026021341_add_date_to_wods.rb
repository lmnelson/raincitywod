class AddDateToWods < ActiveRecord::Migration
  def change
    add_column :wods, :date, :string
  end
end
