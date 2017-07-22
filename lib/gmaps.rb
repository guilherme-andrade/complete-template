class Gmaps4rails
  def markers_for(array_of_objects)
    Gmaps4rails.build_markers(array_of_objects) do |object, marker|
      marker.lat(object.latitude)
      marker.lng(object.longitude)
      marker.infowindow render_to_string(partial: "/#{object.class.to_s.pluralize.downcase}/map_box", locals: {object.class.to_s.downcase.to_sym => object })
    end
  end
end

