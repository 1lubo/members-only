# frozen_string_literal: true

class RemoveColumnFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :string
  end
end
