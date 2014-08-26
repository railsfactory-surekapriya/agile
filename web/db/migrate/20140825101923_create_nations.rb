class CreateNations < ActiveRecord::Migration
  def change
    create_table :nations do |t|
      t.string :country
      t.string :Flag_color
      t.string :image_url
      t.string :capital
      t.decimal :population

      t.timestamps
    end
  end
end
