class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :surveys, :questions do |t|
      t.index [:survey_id, :question_id]
      t.index [:question_id, :survey_id]
    end
  end
end
