# encoding: UTF-8

class Rental < ActiveRecord::Base
	belongs_to :car
	belongs_to :client
	validates_date :start_date, presence: true
	validates_date :stop_date, presence: true
end