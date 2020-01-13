class ReceiptPrinter
  COST = {
    'meat' => 5,
    'milk' => 3,
    'candy' => 1,
  }

  TAX = 0.05

  def initialize(output: $stdout, items:)
    @output = output
    @items = items
  end

  def print
    subtotal = items.reduce(0) do |sum, item|
      output.puts "#{item}: #{sprintf('$%.2f', item_cost(item))}"

      sum + item_cost(item).to_i
    end

    output_divider
    output.puts "subtotal: #{sprintf('$%.2f', subtotal)}"
    output.puts "tax: #{sprintf('$%.2f', subtotal * TAX)}"
    output_divider
    output.puts "total: #{sprintf('$%.2f', subtotal + (subtotal * TAX))}"
  end
  # All of these methods refer to 'subtotal', which is an iterative function
  # defined here.
  # The subtotal method takes an array of items, starts at the beginning, adds
  # them.

  def output_items

  end

  def item_cost(item)
    COST[item]
  end

  def output_divider
    output.puts divider
  end

  def output_subtotal

  end

  def output_tax

  end

  def output_total

  end

  private

  attr_reader :output, :items

  def divider
    '-' * 13
  end
end
