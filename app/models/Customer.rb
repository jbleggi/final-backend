class Customer < ApplicationRecord
  has_many :subscriptions

  after_create :log_new_user

  private
    def log_new_user
      puts "New user was added"
    end
end

# customer.subscription to access customer's subscriptions