class CreateAutoasigneds < ActiveRecord::Migration[4.2]
  def change
    create_table :autoasigneds do |t|
      t.integer :id_project
      t.integer :id_trackers
      t.integer :id_state
      t.integer :id_user
     end
  end
end
