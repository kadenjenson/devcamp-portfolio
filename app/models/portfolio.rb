class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb

#This is how to create scopes
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb ||= "http://via.placeholder.com/350x150"  
  end
end