class CreateBlessings < ActiveRecord::Migration[6.0]
  def change
    create_table :blessings do |t|
      t.string :kind
      t.text :content
      t.string :location

      t.timestamps
    end
  end
end
