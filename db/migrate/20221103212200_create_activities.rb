class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.text :note
      t.boolean :paid, default: false
      t.decimal :value, precision: 10, scale: 2, default: 0.0
      t.datetime :done_at, default: -> { 'now()' }
      t.string :type_a
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
