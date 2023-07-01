class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.string :comment
      
      t.string :word
      t.string :character
      t.string :title

      t.timestamps
      
    end
  end
 
   
end
