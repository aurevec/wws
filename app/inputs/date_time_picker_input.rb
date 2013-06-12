class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.nil?? nil : value.strftime("%d/%m/%Y %H:%M"),
      class: 'datetime-picker'
    }
    super.merge options
  end
end