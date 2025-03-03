def stock_picker(prices)
  max_profit = 0
  best_days = []

  prices.each_with_index do |buy_price, buy_day|
    (buy_day + 1...prices.length).each do |sell_day|
      sell_price = prices[sell_day]
      profit = sell_price - buy_price

      if profit > max_profit
        max_profit = profit
        best_days = [buy_day, sell_day]
      end
    end
  end

  best_days
end

# Example usage
puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect
# Output: [1, 4] (buy on day 1 at $3, sell on day 4 at $15 for a $12 profit)
