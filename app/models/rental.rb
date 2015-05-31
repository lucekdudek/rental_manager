# encoding: UTF-8

class Rental < ActiveRecord::Base
	belongs_to :car
	belongs_to :client
	validate :date_start, presence: true
	validates :date_stop, presence: true
end