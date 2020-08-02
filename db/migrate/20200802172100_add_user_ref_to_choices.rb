class AddUserRefToChoices < ActiveRecord::Migration[6.0]
  def change
    add_reference :choices, :user, foreign_key: true
  end
end
