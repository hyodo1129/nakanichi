class CreateWorkTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :work_times do |t|
      t.belongs_to :user
      t.string :yyyymm, default: '', null: false
      t.integer  :operate_time, default: 0, null: false
      t.datetime :operate_date, null: false

      t.timestamps
    end
  end
end
