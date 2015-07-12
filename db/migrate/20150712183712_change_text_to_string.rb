class ChangeTextToString < ActiveRecord::Migration
  def change
  	change_column :websites, :url, :string
  end
end
