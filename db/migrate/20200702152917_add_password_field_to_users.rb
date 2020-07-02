# frozen_string_literal: true

# Add password digest to users table
class AddPasswordFieldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_diges, :string
  end
end
