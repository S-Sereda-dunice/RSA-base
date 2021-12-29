# frozen_string_literal: true

require_relative 'console/colors_module'

module Utils
  module Console
    include Colors

    private

    require 'io/console'
    require "rqrcode"

    def devider(lenght = 42)
      puts '=' * lenght
    end

    def get_char
      STDIN.getch
    end

    def loop_screen_block
      loop do
        print "\e[2J\e[f"
        yield
        puts "Press eny key to continue or #{red 'Q'} to exit"
        input = get_char.upcase
        break if input == 'Q'
      end
    end

    def qr_print(data = nil)
      data ||= "https://github.com/S-Sereda-dunice/RSA-base"
      puts "\n" + RQRCode::QRCode.new(data).as_ansi(
        light: "\033[47m", dark: "\033[40m",
        fill_character: "  ",
        quiet_zone_size: 1
      )
    end
  end
end
