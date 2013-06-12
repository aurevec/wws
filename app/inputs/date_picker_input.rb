class DatePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.nil?? nil : I18n.localize(value)
    }
    super.merge options
  end

  def input_html_classes
    super.push('date-picker')
  end
end