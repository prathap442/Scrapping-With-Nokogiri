class CreateAptQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :apt_questions do |t|
      t.string :question
      t.string :answer
      t.string :category
      t.string :difficuly
      t.string :question_type
      t.boolean :is_public
      t.string :options

      t.timestamps
    end
  end
end
