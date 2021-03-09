class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def index
  end

  def contact
    @contact = ContactForm.new
  end

  def submit_contact
    @contact = ContactForm.new(contact_params)
      @contact.request = request
      if @contact.deliver
        flash.now[:notice] = 'Thank you for your message!'
        render :contact
      else
        flash.now[:error] = 'Cannot send message.'
        render :contact
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


  def contact_params
    params.require(:contact_form).permit(:name, :email, :tel, :nickname, :message, :captcha)
  end


end
