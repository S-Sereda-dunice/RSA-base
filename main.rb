# frozen_string_literal: true

require_relative 'utils_module'
require_relative 'rsa_class'

include Utils

rsa = Rsa.new

print 'Enter text data: '
data = gets.chop
rsa.encrypt(data)
decrypt_data = Rsa.decrypt(rsa.encrypt_data, rsa.private_key)

devider
puts "#{rsa.public_key.inspect} |> public key"
devider
puts "#{rsa.private_key.inspect} |> private key"
devider
puts "#{data} |> data"
devider
puts "#{rsa.encrypt_data} |> encrypt data"
devider
puts "#{decrypt_data} |> decrypt data on singleton"
puts "#{rsa.decrypt} |> decrypt data on instance"
devider
