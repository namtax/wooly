class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :time
      t.string :campaign
      t.string :validity
      t.string :choice
    end
  end
end
