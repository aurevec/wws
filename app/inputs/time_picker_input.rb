class TimePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.nil?? nil : value.strftime("%H:%M"),
      class: 'time-picker'
    }
    super.merge options
  end
end