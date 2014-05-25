
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

couch = Product.create(name: 'Couch', description: "Tim's old couch. It's in great condition!", price: 50, image_url: 'http://morgantown.shoppok.com/listings/images/34/fUsed_Leather_Couch__x002475_Fairmont_5376cf1328f03.jpg', product_status_id: avail.id)
laptop = Product.create(name: 'Laptop', description: "Dave's used 13-inch MacBook Pro", price: 250, image_url: 'http://cdn1.listmill.com/sites/bitlist/uploads/posts/2013/02/23/328_01_13_3_inch_macbook_pro_2_53ghz__1024.jpg', product_status_id: avail.id)
clubs = Product.create(name: 'Golf Clubs', description: "Zoe's golf clubs in mint condition. Used only once.", price: 25, image_url: 'http://www.westonhistory.org/Images/Golf-clubs.jpg', product_status_id: sold.id)

tim_selling_couch = UsersProducts.create(user_id: tim.id, product_id: couch.id, role_id: seller.id, txn_status_id: open.id)
dave_wanted_couch_tim_declined = UsersProducts.create(user_id: dave.id, product_id: couch.id, role_id: buyer.id, txn_status_id: cancelled.id)

dave_selling_laptop = UsersProducts.create(user_id: dave.id, product_id: laptop.id, role_id: seller.id, txn_status_id: pending.id)
zoe_buying_laptop_pending = UsersProducts.create(user_id: zoe.id, product_id: laptop.id, role_id: buyer.id, txn_status_id: pending.id)

zoe_sold_clubs = UsersProducts.create(user_id: zoe.id, product_id: clubs.id, role_id: seller.id, txn_status_id: complete.id)
tim_bought_clubs = UsersProducts.create(user_id: tim.id, product_id: clubs.id, role_id: buyer.id, txn_status_id: complete.id)
