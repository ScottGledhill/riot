class Sevens < ActiveRecord::Migration
  def change
    create_table :sevens do |t|

      t.timestamps null: false
    end
  end
  end
