seller = Role.create(name: 'Seller')
buyer = Role.create(name: 'Buyer')

open = TxnStatus.create(name: 'Listed')
pending = TxnStatus.create(name: 'Sale Pending')
cancelled = TxnStatus.create(name: 'Sale Cancelled')
payment = TxnStatus.create(name: 'Payment Pending')
complete = TxnStatus.create(name: 'Sale Complete')

# dave = User.create(email: 'davekorsunsky@gmail.com', first_name: 'Dave', last_name: 'Korsunsky')
# tim = User.create(email: 'timsanty@me.com', first_name: 'Tim', last_name: 'Santy')
# zoe = User.create(email: 'zoe.goldfarb@gmail.com', first_name: 'Zoe', last_name: 'Goldfarb')
# courtney = User.create(email: 'cmcilhenny@gmail.com', first_name: 'Courtney', last_name: 'McIlhenny')

couch = Product.create(name: 'Couch', description: "Couch. It's in great condition!", price: 50)
laptop = Product.create(name: 'Laptop', description: "Used 13-inch MacBook Pro", price: 250)
clubs = Product.create(name: 'Golf Clubs', description: "Golf clubs in mint condition. Used only once.", price: 25)
champagne = Product.create(name: 'Champagne for Days', description: "Perfect for any and all occasions! 21 and older.", price: 500)

selling_couch = UsersProducts.create(user_id: 4, product_id: couch.id, role_id: seller.id, txn_status_id: open.id)

selling_laptop = UsersProducts.create(user_id: 4, product_id: laptop.id, role_id: seller.id, txn_status_id: open.id)

selling_clubs = UsersProducts.create(user_id: 3, product_id: clubs.id, role_id: seller.id, txn_status_id: open.id)

selling_champagne = UsersProducts.create(user_id: 3, product_id: champagne.id, role_id: seller.id, txn_status_id: open.id)
