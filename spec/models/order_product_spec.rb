require 'rails_helper'

describe OrderProduct do
  it { should belong_to :order }
  it { should belong_to :product }
  it { should validate_presence_of :quantity }
end
