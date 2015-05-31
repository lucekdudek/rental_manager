# encoding: UTF-8

class Client < ActiveRecord::Base
	has_many :rentals
	validate :firstname, presence: true
	validate :secondname, presence: true
	validate :pesel,
	          presence: true,
	          numericality: true,
	          uniqueness: true,
	          length: {minimum: 11, maximum: 11}
end