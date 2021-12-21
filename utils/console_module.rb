# frozen_string_literal: true

module Utils
  module Console
    private

    require 'io/console'

    def devider(lenght = 42)
      puts '=' * lenght
    end

    def loop_screen_block
      loop do
        print "\e[2J\e[f"
        yield
        puts 'Press eny key to continue or Q to exit'
        input = STDIN.getch.upcase
        break if input == 'Q'
      end
    end
  end
end
