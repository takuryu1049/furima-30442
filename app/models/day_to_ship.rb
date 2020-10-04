class DayToShip < ActiveHash::Base
  self.data = [
  { id: 1, day_to_ship: '--' },
  { id: 2, day_to_ship: '1~2日で発送' },
  { id: 3, day_to_ship: '2~3日で発送' },
  { id: 4, day_to_ship: '4~7日で発送' }
  ]
end
