class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.references :opcao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
