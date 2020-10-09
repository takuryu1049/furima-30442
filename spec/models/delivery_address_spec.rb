require 'rails_helper'

RSpec.describe DeliveryAddress, type: :model do
  belongs_to :order
end
