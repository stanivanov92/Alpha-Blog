# frozen_string_literal: true

# migration file for adding the an admin boolean
class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
