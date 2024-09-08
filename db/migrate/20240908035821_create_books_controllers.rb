class CreateBooksControllers < ActiveRecord::Migration[7.2]
  def change
    create_table :books_controllers do |t|
      t.timestamps
    end
  end
end
