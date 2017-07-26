module FormHelper
  def default_form_for(object, options = {})
    form = []
    bootstrap_form_for(object, remote: options[:remote]) do |f|
      object.permitted_attributes.each do |attribute|
        form << input_type_for(attribute, f)
      end
      form << f.submit('Submit', class: 'btn btn-lg btn-default')
    end
    safe_join(form)
  end

  def input_type_for(attribute, f)
    case attribute
    when "photo"
      return (f.input(attribute.to_sym, as: :attachinary))
    when "tags"
      return (f.input(attribute.to_sym, as: :selectize, collection: ["one", "two", "three"]))
    else
      return (f.input(attribute.to_sym))
    end
  end
end
