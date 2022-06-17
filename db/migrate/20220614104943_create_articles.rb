# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.belongs_to :user
      t.string :title
      t.string :string
      t.string :text

      t.timestamps
    end
  end
end
