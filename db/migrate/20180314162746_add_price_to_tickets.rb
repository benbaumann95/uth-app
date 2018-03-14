class AddPriceToTickets < ActiveRecord::Migration[5.1]
  def change
    add_monetize :tickets, :pricing, currency: { present: false }
  end
end
