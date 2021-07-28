class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :order

    def self.most_expensive
        all.max_by {|order| order.price}
    end
end