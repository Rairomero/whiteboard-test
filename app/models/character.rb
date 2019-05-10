class Character < ApplicationRecord
  attr_writer :current_step

  validates_presence_of :name, :if => lambda { |o| o.current_step == "name" }
  validates_presence_of :color_claws, :if => lambda { |o| o.current_step == "color_claws" }
  validates :user_id, uniqueness: true

  enum color_claws: [:gray, :black, :white, :gold, :sand, :silver]
  enum kinds: [:wizard, :sorcerer, :warrior, :knight,
              :hunter, :assassin, :priest, :healer]

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[name color_claws kind]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
    
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
    
  def first_step?
    current_step == steps.first
  end
    
  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end 
end
  