class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|

      t.string     :post_code,            null: false
      t.integer    :area_id,              null: false
      t.string     :municipality,         null: false
      t.string     :street,               null: false
      t.string     :building                   
      t.string     :tel,                  null: false
      t.references :purchase,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
