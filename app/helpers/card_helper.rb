module CardHelper
  def card_for(element)
    Card.new(self, element)
  end

  class Card
    def initialize(element)
      @view, element = view, element
      @uid = SecureRandom.hex(6)
      @class = element.class.to_s.downcase
      @controller = "#{element.class.to_s.downcase}s"
    end

    def html
      content = safe_join([link, details])
    end

    private

    attr_accessor :view, :element, :uid, :class
    delegate :link_to, :content_tag, :carousel_for, :safe_join, to: :view

    def link # image carousel and link to show page
      link_content = content_tag(:div, carousel_for(element.photos), class: 'card')
      link = link_to(link_content, controller: @controller, action: "show", id: element.id, class: 'card-link')
    end

    def details # rest of the card
      if @class == "property"
        price = element.rooms.order(price: :asc).first.price
        name = element.name
        reviews = element.rooms.reviews.average(:rating)
        title = link_to controller: @controller, action: "show", id: element.id, anchor: "overview", class: "card-name" do
          content_tag(:strong, "From #{price}$/night - #{name}")
        end
      else
        price = element.price
        name = element.name
        reviews = element.reviews.average(:rating)
        title = link_to controller: @controller, action: "show", id: element.id, anchor: "overview", class: "card-name" do # MUDAR CONTROLLER E ANCHOR
          content_tag(:strong, "#{price}$/night - #{name}")
        end
      end

      #title_line = content_tag(ul:, [content_tag(li:, title), content_tag(li:, (render 'shared/reviews', reviews: reviews))]), class: 'list-inline')
      address_line = link_to content_tag(:p, element.address), controller: @controller, action: "show", id: element.id, anchor: "map", class: "card-address"
      title_line = link_to content_tag(:p, element.address), controller: @controller, action: "show", id: element.id, anchor: "map", class: "card-address"
      details = content_tag(:div, safe_join([title_line, address_line]), class: 'card-details')
    end
  end
end
