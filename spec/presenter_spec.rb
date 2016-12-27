require "spec_helper"
require "active_record"

class User < ActiveRecord::Base
  establish_connection(adapter: "sqlite3", database: "feint.db")
  connection.create_table table_name, force: true do |t|
    t.string  :name
    t.integer :age
  end
end

class UserPresenter < Feint::Presenter
  attributes :name, :age
end

class UserTransformer < Feint::Presenter
  transform name: :handle, age: :year
end

describe Feint::Presenter do
  let(:user) { User.create(name: "shelling", age: 30) }

  it "takes present attributes" do
    user_presenter = UserPresenter.new(user)
    expect(user_presenter.name).to eq(user.name)
    expect(user_presenter.age).to  eq(user.age)
  end

  it "transforms attributes" do
    user_transformer = UserTransformer.new(user)
    expect(user_transformer.handle).to eq(user.name)
    expect(user_transformer.year).to   eq(user.age)
  end
end
