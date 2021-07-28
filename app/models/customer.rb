class Customer < ActiveRecord::Base
    has_many :orders, dependent: :destroy
    has_many :coffees, through: :orders

    def self.names
        Customer.all.map {|c| c.name}
    end

    def order_coffee(coffee_title, price)
        Order.create(price: price, customer_id: self.id, coffee_id: Coffee.all.find_by(title: coffee_title).id)
        puts "#{coffee_title}, $#{price} for #{name}"
    end

    def total_purchases_amount
        orders.map {|order| order.price}.sum
    end

    def dislike_coffee(coffee_title)
        orders.where(coffee_id: Coffee.all.find_by(title: coffee_title).id).last.destroy
        puts "#{name} has been refunded $#{orders.where(coffee_id: Coffee.all.find_by(title: coffee_title).id).last.price}"
    end
end