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

Address.create(
  street: '567 Yonge St',
  province: 'ON',
  country: 'Canada',
  zip: '6T5',
  phone: '647-123-4567',
)

Address.create(
  street: '945 Avenue Rd',
  province: 'ON',
  country: 'Canada',
  zip: 'M1C 6K5',
  phone: '416-123-8569',
)

Address.create(
  street: '189 Keele St',
  province: 'ON',
  country: 'Canada',
  zip: 'K3C 9T5',
  phone: '416-123-9568',
)

PurchaseOrder.create(
  lname: 'Amelia',
  fname: 'Brown',
  status: 'PROCESSED',
  address_id: 1,
)

PurchaseOrder.create(
  lname: 'Peter',
  fname: 'Bennett',
  status: 'DENIED',
  address_id: 2,
)

PurchaseOrder.create(
  lname: 'Yixi',
  fname: 'Xie',
  status: 'ORDERED',
  address_id: 3,
)

PoItem.create(
  item_id: 1,
  bid: 'b001',
  price: 20,
  purchase_order_id: 1,
)

PoItem.create(
  item_id: 2,
  bid: 'c001',
  price: 500,
  purchase_order_id: 2,
)

Review.create(
  rating: 4,
  comment: 'Loved my sunnyglasses1! The perfect pair of glasses to go out.',
  item_id: 1,
)

Review.create(
  rating: 0,
  comment: 'Enjoyed my eyeglasses1. A decent pair of glasses to read. Too small though.',
  item_id: 2,
)
