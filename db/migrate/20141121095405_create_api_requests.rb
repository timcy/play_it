class CreateApiRequests < ActiveRecord::Migration
  def change
    create_table :api_requests do |t|
      t.string :request
      t.string :param
      t.string :response
      t.datetime :in_datetime

      t.references :user

      t.timestamps
    end
  end
end
