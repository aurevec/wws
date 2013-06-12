class SaleDecorator < Draper::Decorator
  delegate_all

  def name
    source.house.name + " (" + l(source.begin_date) + " - " + l(source.end_date) + ")"
  end

  def house_name
  	if source.house.present?
  		source.house.name
  	else
  		"-"
  	end
  end

end