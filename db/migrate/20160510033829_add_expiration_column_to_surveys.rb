class AddExpirationColumnToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :expiration, :datetime
  end
end
