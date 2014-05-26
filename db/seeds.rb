avail = ProductStatus.create(name: 'Available')
sold = ProductStatus.create(name: 'Sold')
expired = ProductStatus.create(name: 'Expired')

seller = Role.create(name: 'Seller')
buyer = Role.create(name: 'Buyer')

open = TxnStatus.create(name: 'Listed')
pending = TxnStatus.create(name: 'Sale Pending')
cancelled = TxnStatus.create(name: 'Sale Cancelled')
payment = TxnStatus.create(name: 'Payment Pending')
complete = TxnStatus.create(name: 'Sale Complete')

dave = User.create(email: 'davekorsunsky@gmail.com', first_name: 'Dave', last_name: 'Korsunsky')
tim = User.create(email: 'timsanty@me.com', first_name: 'Tim', last_name: 'Santy')
zoe = User.create(email: 'zoe.goldfarb@gmail.com', first_name: 'Zoe', last_name: 'Goldfarb')
courtney = User.create(email: 'cmcilhenny@gmail.com', first_name: 'Courtney', last_name: 'McIlhenny')

couch = Product.create(name: 'Couch', description: "Tim's old couch. It's in great condition!", price: 50, avatar: 'https://s3-us-west-1.amazonaws.com/beethree/products/avatars/000/000/005/square/blue-nose-pitbulls-puppiespin-blue-nose-pitbull-puppies-for-sale-in-indianapolis-on-pinterest-kw9e18pt.jpg', product_status_id: avail.id)
laptop = Product.create(name: 'Laptop', description: "Dave's used 13-inch MacBook Pro", price: 250, avatar: 'https://s3-us-west-1.amazonaws.com/beethree/products/avatars/000/000/005/square/blue-nose-pitbulls-puppiespin-blue-nose-pitbull-puppies-for-sale-in-indianapolis-on-pinterest-kw9e18pt.jpg', product_status_id: avail.id)
clubs = Product.create(name: 'Golf Clubs', description: "Zoe's golf clubs in mint condition. Used only once.", price: 25, avatar: 'https://s3-us-west-1.amazonaws.com/beethree/products/avatars/000/000/005/square/blue-nose-pitbulls-puppiespin-blue-nose-pitbull-puppies-for-sale-in-indianapolis-on-pinterest-kw9e18pt.jpg', product_status_id: sold.id)
champagne = Product.create(name: 'Champagne for Days', description: "Perfect for any and all occasions! 21 and older.", price: 500, avatar: 'https://s3-us-west-1.amazonaws.com/beethree/products/avatars/000/000/005/square/blue-nose-pitbulls-puppiespin-blue-nose-pitbull-puppies-for-sale-in-indianapolis-on-pinterest-kw9e18pt.jpg', product_status_id: sold.id)

tim_selling_couch = UsersProducts.create(user_id: tim.id, product_id: couch.id, role_id: seller.id, txn_status_id: open.id)
dave_wanted_couch_tim_declined = UsersProducts.create(user_id: dave.id, product_id: couch.id, role_id: buyer.id, txn_status_id: cancelled.id)

dave_selling_laptop = UsersProducts.create(user_id: dave.id, product_id: laptop.id, role_id: seller.id, txn_status_id: pending.id)
zoe_buying_laptop_pending = UsersProducts.create(user_id: zoe.id, product_id: laptop.id, role_id: buyer.id, txn_status_id: pending.id)

zoe_sold_clubs = UsersProducts.create(user_id: zoe.id, product_id: clubs.id, role_id: seller.id, txn_status_id: complete.id)
tim_bought_clubs = UsersProducts.create(user_id: tim.id, product_id: clubs.id, role_id: buyer.id, txn_status_id: complete.id)

courtney_waiting_for_payment_on_champagne = UsersProducts.create(user_id: courtney.id, product_id: champagne.id, role_id: seller.id, txn_status_id: payment.id)
dave_charged_for_champagne = UsersProducts.create(user_id: dave.id, product_id: champagne.id, role_id: buyer.id, txn_status_id: payment.id)
