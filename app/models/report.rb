class Report < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :width, :height, :cost, :comment
  validates :width, numericality: { only_integer: true }
  validates :height, numericality: { only_integer: true }
  validates :cost, numericality: true
end
