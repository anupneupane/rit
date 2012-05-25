class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
