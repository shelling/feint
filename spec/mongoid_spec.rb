require "spec_helper"
require "mongoid"

Mongoid.load_configuration({
  clients: {
    default: {
      database: "feint",
      hosts: ["localhost:27017"],
    }
  }
})

class Order
  include Mongoid::Document
end

describe Order do
  it "should initialize a Mongoid instance" do
    expect {
      Order.create
    }.to change {
      Order.count
    }.by(1)
  end
end
