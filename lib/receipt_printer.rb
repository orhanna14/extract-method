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
    output_items
    output_divider
    output_subtotal
    output_tax
    output_divider
    output_total
  end

  def iterate_through_items

  end
  # Ah, okay, use the same loop, but split it up. One to do the math, one to
  # print the text.

  def output_items
    items.each do |item|
      output.puts "#{item}: #{sprintf('$%.2f', item_cost(item))}"
    end
  end

  def subtotal
    items.reduce(0) do |sum, item|
      sum + item_cost(item).to_i
    end
  end

  def item_cost(item)
    COST[item]
  end

  def output_divider
    output.puts divider
  end
  # Each of the methods below is doing the math. 
  def output_subtotal
    output.puts "subtotal: #{sprintf('$%.2f', subtotal)}"
  end

  def output_tax
    output.puts "tax: #{sprintf('$%.2f', subtotal * TAX)}"
  end

  def output_total
    output.puts "total: #{sprintf('$%.2f', subtotal + (subtotal * TAX))}"
  end

  private

  attr_reader :output, :items

  def divider
    '-' * 13
  end
end
