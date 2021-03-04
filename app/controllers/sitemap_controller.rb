class SitemapController < ApplicationController

  def index

    @pages = ['', 'about.html', 'contacts.html', 'services.html', 'portfolio.html']

    @products = Product.all

    respond_to do |format|
      format.xml
    end
  end

end
