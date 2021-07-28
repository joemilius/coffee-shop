class Coffee < ActiveRecord::Base
    has_many :orders, dependent: :destroy
    has_many :customers, through: :orders

    def unique_customer_names
        customers.uniq
    end

    def self.most_ordered
        includes(:orders).all.max_by {|coffee| coffee.orders.length}
    end
end