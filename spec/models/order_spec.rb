require 'rails_helper'

RSpec.describe Order, type: :model do
  belongs_to :user
  belongs_to :item
  has_one    :delivery_address
end
