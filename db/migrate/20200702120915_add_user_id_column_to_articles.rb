# frozen_string_literal: true

# Migration file for adding a user column to the articles table
class AddUserIdColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user_id, :int
  end
end
