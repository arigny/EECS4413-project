# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Item.create(
  bid: 'b001',
  name: 'sunnyglasses1',
  description: 'A pair of glasses to go out',
  category: 'sunglasses',
  brand: 'Prada',
  quantity: 20,
  price: 100,
  colour: 'purple',
  size: 'small',
  weight: '30',
)

Item.create(
  bid: 'c001',
  name: 'sunnyglasses2',
  description: 'A pair of glasses to go out',
  category: 'sunglasses',
  brand: 'Prada',
  quantity: 500,
  price: 100,
  colour: 'white',
  size: 'large',
  weight: '40',
)

Item.create(
  bid: 'd001',
  name: 'eyeglasses1',
  description: 'A pair of glasses to read',
  category: 'eyeglasses',
  brand: 'Kors',
  quantity: 1500,
  price: 100,
  colour: 'black',
  size: 'small',
  weight: '30',
)

VisitEvent.create(
  ipaddress: '1.23.4.5',
  day: '12202022',
  bid: 'b001',
  eventtype: 'VIEW',
  item_id: 1,
)

VisitEvent.create(
  ipaddress: '1.23.4.5',
  day: '12242022',
  bid: 'b001',
  eventtype: 'CART',
  item_id: 1,
)

VisitEvent.create(
  ipaddress: '1.23.4.5',
  day: '12252022',
  bid: 'b001',
  eventtype: 'PURCHASE',
  item_id: 1,
)
