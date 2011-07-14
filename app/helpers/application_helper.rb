module ApplicationHelper
  def logo
    image_tag('logo.png', :alt => 'Tutor', :class => "logo")
  end

    # put this in the body after a form to set the input focus to a specific control id
    # at end of rhtml file: <%= set_focus_to_id 'form_field_label' %>
  def set_focus_to_id(id)
    javascript_tag("$('##{id}').focus()");
  end
end
