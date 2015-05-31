# encoding: UTF-8

class Category < ActiveRecord::Base
	has_many :cars
	validate :category, presence: true, uniqueness: true
	validate :price, presence: true, numericality: true
end