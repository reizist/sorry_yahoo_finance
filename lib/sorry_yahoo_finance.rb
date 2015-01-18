require 'yaml'

$:.unshift(File.dirname(__FILE__))
require "sorry_yahoo_finance/acquirer"
require "sorry_yahoo_finance/utils/all_stock_codes"

module SorryYahooFinance
  class << self
    # Goodby Ruby < 2.0
    def find(*codes, date: nil, lang: :ja, format: true)
      acquirer = Acquirer.new(codes, date)
      output_hash = acquirer.output(lang, format)
      output_hash.count == 1 ? output_hash.first : output_hash
    end

    # TODO: Lazy
    def find_all(date: nil, lang: :ja, format: true)
      acquirer = Acquirer.new(AllStockCodes::CODES, date)
      acquirer.output(lang, format)
    end
  end
end

# Make alias
YahooFinance = SorryYahooFinance
