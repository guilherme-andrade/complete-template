class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # use these variables to trigger the appearance of the related components in the view


  def home
    @enable_dashboard_cta = false
    @enable_sub_navbar = true
    @enable_banner = true
    @disable_search = false
    @fix_navbar = true
  end
end
