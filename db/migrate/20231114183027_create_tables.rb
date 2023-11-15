class CreateTables < ActiveRecord::Migration[7.0]
    def change
      create_table :users do |t|
        t.string :name
        t.string :photo
        t.text :bio
        t.integer :posts_counter, default: 0
        t.timestamps
      end
  
      create_table :posts do |t|
        t.belongs_to :user, foreign_key: { to_table: :users, name: "author_id" }, index: true
        t.string :title
        t.text :text
        t.integer :comments_counter, default: 0
        t.integer :likes_counter, default: 0
        t.timestamps
      end
  
      create_table :comments do |t|
        t.belongs_to :user, foreign_key: true
        t.belongs_to :post, foreign_key: true
        t.text :text
        t.timestamps
      end
  
      create_table :likes do |t|
        t.belongs_to :user, foreign_key: true
        t.belongs_to :post, foreign_key: true
        t.timestamps
      end
    end
  end
  