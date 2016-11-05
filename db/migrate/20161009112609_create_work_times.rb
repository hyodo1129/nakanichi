# coding: utf-8
class CreateWorkTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :work_times do |t|
      t.belongs_to :user
      t.string :yyyymm, default: '', null: false
      t.integer :until_current_work_time, default: 0, null: false, comment: '稼働時間'
      t.integer :holiday_plan, default: 0, null: false, comment: '休暇取得予定日数'

      t.timestamps
    end
  end
end
