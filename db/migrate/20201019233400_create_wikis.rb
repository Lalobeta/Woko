class CreateWikis < ActiveRecord::Migration[5.2]
  def change
    create_table :wikis do |t|
      t.belongs_to  :author
      t.string      :title
      t.text        :description
      t.text        :content
      t.timestamps
    end
  end
end
