class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|

      t.timestamps null: false
    end
  end
end
