# frozen_string_literal: true

require_relative 'utils_module'

class Rsa
  attr_reader :public_key, :private_key, :encrypt_data

  def initialize
    @public_key, @private_key = Rsa.gen_keys
                                   .values_at(:public_key, :private_key)
  end

  def encrypt(data)
    @encrypt_data = Rsa.encrypt(data, @public_key)
  end

  def decrypt(encrypt_data = @encrypt_data)
    Rsa.decrypt(encrypt_data, @private_key)
  end

  class << self
    include Utils

    def gen_keys
      p  = random_prime
      q  = random_prime
      n  = p * q
      fe = (p - 1) * (q - 1)
      e  = PRIME_RANDOM_ARRAY.find { |e| (e < fe) && (e.gcd(fe) == 1) }
      # TODO: Make a normal d search in math
      d  = (0...fe).find { |x| x * e % fe == 1 }

      { public_key: [e, n], private_key: [d, n] }
    end

    def encrypt(data, (e, n))
      encrypt_bytes_array = data.bytes.map do |byte|
        (byte**e % n).to_s(32)
      end.join('/')
    end

    def decrypt(encrypted_data, (d, n))
      decrypt_bytes_array = encrypted_data.split('/').map do |byte|
        byte.to_i(32)**d % n
      end.pack('c*')
    end
  end
end
