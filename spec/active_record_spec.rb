require "spec_helper"
require "active_record"

class Product < ActiveRecord::Base
  establish_connection(adapter:  "sqlite3", database: "feint.db")
  connection.create_table table_name, force: true do |t|
    t.string  :name
    t.text    :description
  end
end

describe Product do
  it "could initialize and save a ActiveRecord instance" do
    expect {
      Product.create
    }.to change {
      Product.count
    }.by(1)
  end
end
