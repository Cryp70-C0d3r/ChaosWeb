class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Contact.new
        format.html { render 'contact'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'contact' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end

  def services
  end

  def portfolio
  end

  def order_success
  end

  def order_cancel
  end
end
