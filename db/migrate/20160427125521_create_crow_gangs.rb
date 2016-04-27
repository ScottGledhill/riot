class CreateCrowGangs < ActiveRecord::Migration
  def change
    create_table :crow_gangs do |t|

      t.timestamps null: false
    end
  end
end
