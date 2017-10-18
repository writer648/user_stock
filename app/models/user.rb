class User < ApplicationRecord

  # Relationships

  # Scope Lambdas
  scope :sorted, lambda { order("email ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["email LIKE ?", "%#{query}%"])}

end
