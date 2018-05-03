class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.string :place
      t.string :days
      t.string :day_from
      t.string :day_to
      t.string :return_home
      t.string :full_name
      t.integer :birth_year
      t.string :address
      t.string :school_name
      t.string :group_name
      t.string :parents_names
      t.string :special_needs
      t.string :health_status
      t.string :tezec
      t.string :blonnica
      t.string :dur
      t.string :vaccine_other
      t.string :pesel

      t.timestamps
    end
  end
end
