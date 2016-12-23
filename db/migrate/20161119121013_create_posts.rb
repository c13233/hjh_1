class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :city
      t.string :country
      t.string :title
      t.string :address
      t.text :content
      t.string :people
      t.integer :filter
      t.integer :image
      t.integer :clicks

      t.timestamps null: false
    end

  end
end
