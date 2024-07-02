class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|

      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
