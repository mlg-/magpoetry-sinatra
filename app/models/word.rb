class Word < ActiveRecord::Base
  validates_presence_of :word
  validates_presence_of :part_of_speech
  validates_presence_of :flarf
end
