class CreateRewardUsers < ActiveRecord::Migration
  def change
    create_table :reward_users do |t|
      t.references :reward, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
