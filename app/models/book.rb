class Book < ApplicationRecord

  # validations
  validates :name, presence: true

  validates :category, presence: true
    
  validates :author, presence: true
  
  validates :description, length: { minimum: 100 }
  
  validates :almaty_quantity, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }
  
  validates :shymkent_quantity, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }
  
  validates :image_src, format: {
    with: /\w+\.(jpg|png|jpeg)\z/i,
    message: 'must be a JPG, JPEG, or PNG image'
  }

  # class methods
  def self.newest
    order('created_at DESC').limit(20)
  end

  def self.all_ordered_by_name
    order('name ASC')
  end

  def self.search(query)
    q = '%' + query.capitalize + '%'
    where('name LIKE ?', q)
  end

  # instance methods
  def almaty_out_of_stock?
    almaty_quantity.blank? || almaty_quantity.zero?
  end

  def shymkent_out_of_stock?
    shymkent_quantity.blank? || shymkent_quantity.zero?
  end
  
end
