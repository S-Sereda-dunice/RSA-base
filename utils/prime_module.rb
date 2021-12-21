# frozen_string_literal: true

module Utils
  module Prime
    private

    require 'prime'

    PRIME_MIN_SLICE = 1e1.to_i
    PRIME_MAX_SLICE = 1e2.to_i

    PRIME_RANDOM_ARRAY = ::Prime.take(PRIME_MAX_SLICE)
                                .slice(PRIME_MIN_SLICE,
                                       PRIME_MAX_SLICE - PRIME_MIN_SLICE)
                                .shuffle

    def random_prime
      PRIME_RANDOM_ARRAY.sample
    end
  end
end
