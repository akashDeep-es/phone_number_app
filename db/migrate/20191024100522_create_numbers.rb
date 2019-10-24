class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.string :ph_num
    end
    add_index :numbers, :ph_num, :unique => true
  end
end
