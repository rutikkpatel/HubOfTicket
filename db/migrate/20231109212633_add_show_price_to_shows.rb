class AddShowPriceToShows < ActiveRecord::Migration[7.1]
  def change
    add_column :shows, :show_price, :integer
  end
end
