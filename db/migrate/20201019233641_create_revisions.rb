class CreateRevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :revisions do |t|
      t.belongs_to :wiki
      t.integer :number
      t.string :nomenclature
      t.timestamps
    end
  end
end
