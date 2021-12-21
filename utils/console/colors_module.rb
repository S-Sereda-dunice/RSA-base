# frozen_string_literal: true

module Utils
  module Console
    module Colors
      private

      def reset(string)
        "\033[0m#{string}"
      end

      def yellow(string)
        "\u001b[33;1m#{string}\033[0m"
      end

      def blue(string)
        "\u001b[38;5;39;1m#{string}\033[0m"
      end

      def dark_blue(string)
        "\u001b[38;5;39;1m#{string}\033[0m"
      end

      def light_blue(string)
        "\u001b[38;5;117;1m#{string}\033[0m"
      end

      def red(string)
        "\u001b[38;5;196;1m#{string}\033[0m"
      end

      def green(string)
        "\u001b[32;1m#{string}\033[0m"
      end
    end
  end
end
