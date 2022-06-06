require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(instance)
        p instance.num_near_matches(@secret_code)
        p instance.num_exact_matches(@secret_code)
    end

    def ask_user_for_guess
        p "Enter a code"

        input = gets.chomp

        guess = Code.from_string(input)

        p guess.num_exact_matches(@secret_code)
        p guess.num_near_matches(@secret_code)

        return guess == @secret_code

    end
end
