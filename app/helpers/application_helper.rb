module ApplicationHelper
  #Submit or cancel for the forms.
  def submit_or_cancel(form,name='Cancel')
    form.submit + " or " + 
    link_to(name, 'javascript:history.go(-1);', :class => 'cancel') 
  end
end
