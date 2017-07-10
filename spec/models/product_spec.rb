require 'rails_helper'

describe Product do
  it { should have_many :orders }
  it { should have_many :order_products }
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
end
