module Admin::SalesHelper
  def active_sale?
    Sale.active.any?
  end

  def get_sale_data
    sale = Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
    sale
  end


end
