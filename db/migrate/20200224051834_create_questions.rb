class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :text
      t.datetime :posted_at

      t.timestamps
    end
  end
end
