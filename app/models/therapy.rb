class Therapy < ActiveRecord::Base
  attr_accessible :description, :name, :exercises_attributes, :exercises_attributes

  has_many :therapies_exercises
  has_many :exercises, :through => :therapies_exercises

  has_many :therapies_tags
  has_many :tags, :through => :therapies_tags

  has_many :saved_therapies

  accepts_nested_attributes_for :exercises
end
