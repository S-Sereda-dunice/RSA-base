# frozen_string_literal: true

module Utils
  private

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
end
