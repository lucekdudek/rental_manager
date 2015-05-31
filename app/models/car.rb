# encoding: UTF-8

class Car < ActiveRecord::Base
	belongs_to :category
	has_many :rentals
	validate :name, presence: true
	validate :description 
end