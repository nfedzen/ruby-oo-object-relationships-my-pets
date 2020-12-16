require 'pry'

class Owner
  # code goes here
  attr_reader :species, :name
  
  @@all = []

  def initialize name, species = "human"
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats 
    Cat.all.filter do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.filter do |dog|
      dog.owner == self
    end
  end

  def buy_cat name
    Cat.new(name, self)
  end

  def buy_dog name
    Dog.new(name, self)
  end


  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    cats.map do |cat1|
      cat1.mood = 'nervous'
      cat1.remove_owner
    end
    dogs.each do |dog|
      dog.mood = 'nervous'
      dog.remove_owner
    end
  end 

  def list_pets
    sum_of_dogs = dogs.count
    sum_of_cats = cats.count
    p "I have #{sum_of_dogs} dog(s), and #{sum_of_cats} cat(s)."
  end
end