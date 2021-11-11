class CreateCodewarsInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :codewars_infos do |t|
      t.string :username
      t.string :name
      t.string :clan
      t.string :honor
      t.string :leaderboard_position
      t.string :total_authored
      t.string :total_completed
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
