class CreateOpcaos < ActiveRecord::Migration[6.0]
  def change
    create_table :opcaos do |t|
      t.string :nome
      t.integer :pontos
      t.references :enquete, null: false, foreign_key: true

      t.timestamps
    end
  end
end
