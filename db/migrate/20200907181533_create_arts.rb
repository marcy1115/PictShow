class CreateArts < ActiveRecord::Migration[6.0]
  def change
    create_table :arts do |t|
      t.references :user,      null: false, foreign_key: true
      t.string     :title,     null: false
      t.text       :text
      t.string     :age_limit, null: false
      t.timestamps
    end
  end
end
