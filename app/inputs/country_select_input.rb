class CountrySelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push('chosen-select country_select')
  end

  def collection
    @countries         = Country.select([:id, :iso, :name])
    favorite_countries = @countries.select{|c| c.iso =="BE" || c.iso == "FR"}
    @countries         = @countries.reject{|c| c.iso =="BE" || c.iso == "FR"}
    return @countries.insert(0, favorite_countries).flatten
  end
end