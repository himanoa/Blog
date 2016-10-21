class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body_html
      t.text :body_md
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
