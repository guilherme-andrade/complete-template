module FormHelper
  def default_form_for(object, options = {})
    form = []
    simple_form_for(object, remote: options[:remote]) do |f|
      object.permitted_attributes.each do |attribute|
        form << f.input(attribute.to_sym)
      end
      form << f.submit('Submit', class: 'btn btn-lg btn-default')
    end
    safe_join(form)
  end
end
