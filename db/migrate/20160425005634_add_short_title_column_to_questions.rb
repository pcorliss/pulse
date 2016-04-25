class AddShortTitleColumnToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :short_title, :string
  end
end
