# frozen_string_literal: true

require_relative 'utils/console_module'
require_relative 'rsa_class'

include Utils::Console

MENU_POINTS = ['Test encrypt/decrypt',
               'Encrypt string data',
               'Decrypt string data'].freeze

def test
  rsa = Rsa.new
  data = 'lol kek rsa on ruby'
  encrypt(data, rsa)
  decrypt_data = Rsa.decrypt(rsa.encrypt_data, rsa.private_key)

  devider
  puts "decrypt data on singleton |> #{dark_blue decrypt_data}"
  devider
  puts "decrypt data on instance |> #{dark_blue rsa.decrypt}"
  devider
end

def encrypt(data = nil, rsa = Rsa.new)
  unless data
    print 'Enter text data: '
    data = gets.chop
  end

  encrypt_data = rsa.encrypt(data)

  devider
  puts "data |> #{dark_blue data}"
  devider
  puts "public key |> #{dark_blue rsa.public_key.inspect}"
  devider
  puts "private key |> #{dark_blue rsa.private_key.inspect}"
  devider
  puts "encrypt data |> #{dark_blue rsa.encrypt_data}"
  devider
  encrypt_data
end

def decrypt(encrypt_data = nil, private_key = nil)
  unless encrypt_data
    puts 'Enter encrypted data'
    encrypt_data = gets.chop.strip
  end

  unless private_key
    puts 'Enter private key'
    private_key = gets.chop
                      .strip
                      .gsub(/[\[\] ]/, '')
                      .split(',')
  end
  decrypt_data = Rsa.decrypt(encrypt_data, private_key)
  puts "decrypt data |> #{dark_blue decrypt_data}"
  decrypt_data
end

def map_info
  MENU_POINTS.map
             .with_index { |str, i| "#{yellow "#{i + 1}."} #{green str}" }
             .join("\n")
end

loop_screen_block do
  print "
#{blue 'Select a menu item'}
#{map_info}
#{yellow '9.'} #{red 'Exit'}
>> "
  case gets.chop.to_i
  when 1 then test
  when 2 then encrypt
  when 3 then decrypt
  when 9 then break
  else puts 'nope'
  end
end
