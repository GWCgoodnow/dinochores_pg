class AddStatusWhereToChores < ActiveRecord::Migration
  def change
    add_column :chores, :status_where, :string
  end
end
