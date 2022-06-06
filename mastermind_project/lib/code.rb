class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
      array.each do |ele|
        if !POSSIBLE_PEGS.has_key?(ele.upcase)
          return false
        end
      end

      return true
  end

  def initialize(array)
    if !Code.valid_pegs?(array)
      raise "these are not valid pegs"
    end

    new_array = []

    array.each do |ele|
      new_array << ele.upcase
    end

    @pegs = new_array
  end

  def pegs
    @pegs
  end

  def self.random(length)
    array = []

    POSSIBLE_PEGS.each_key do |key|
      array.push(key)
    end

    new_array = Array.new(length, array.sample)

    Code.new(new_array)
  end

  def self.from_string(string)
    array = []

    string.each_char do |char|
      array << char.upcase
    end

    Code.new(array)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_instance)
    count = 0
    guess = guess_instance.pegs

    @pegs.each_with_index do |ele, i|
      if guess[i] == ele
        count += 1
      end
    end

    count
  end

  def num_near_matches(guess_instance)
    count = 0
    guess = guess_instance.pegs
    correct_colors_hash = Hash.new(0)
    correct_colors = []

    @pegs.each do |ele|
      correct_colors_hash[ele] += 1
    end

    correct_colors_hash.each do |color, v|
      if v == 1
        correct_colors << color
      end
    end

    @pegs.each_with_index do |ele, i|
      if guess[i] != ele && correct_colors.include?(ele)
        count += 1
      end
    end


    count
  end 

  def ==(instance)
    guess = instance.pegs

    if guess.length != @pegs.length
      return false
    end

    if instance.pegs != self.pegs
      return false
    end

    return true
  end

end
