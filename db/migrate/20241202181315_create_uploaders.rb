class CreateUploaders < ActiveRecord::Migration[7.2]
  def change
    create_table :uploaders do |t|
      t.string :title

      t.timestamps
    end
  end
end
