class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :photo
      
      t.timestamps null: false

      t.index [:user, :photo], unique: true  
    end
  end
end
