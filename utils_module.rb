# frozen_string_literal: true

module Utils
  private

  require 'prime'

  PRIME_MIN_SLICE = 1e1.to_i
  PRIME_MAX_SLICE = 1e2.to_i

  PRIME_RANDOM_ARRAY = Prime.take(PRIME_MAX_SLICE)
                            .slice(PRIME_MIN_SLICE,
                                   PRIME_MAX_SLICE - PRIME_MIN_SLICE)
                            .shuffle

  def random_prime
    PRIME_RANDOM_ARRAY.sample
  end

  def timeshtamp
    Time.now.to_f
  end

  def timelog(signal, comment = nil)
    if signal == 'start'
      @log_start = timeshtamp
      puts "start #{comment}"
    elsif signal == 'stop'
      log_end = timeshtamp
      puts "stop #{comment} duration #{log_end - @log_start}s"
    end
  end

  def devider(lenght = 42)
    puts '=' * lenght
  end
end
