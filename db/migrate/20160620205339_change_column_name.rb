class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :chefs, :name, :chefname
  end
end
