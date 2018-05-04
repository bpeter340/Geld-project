class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    if user_signed_in?
      params[:contact][:name] = current_user.first_name
      params[:contact][:email] = current_user.email
    end
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error]=nil
    else
      flash.now[:error] = "Cannot Send Message"
      render :new
    end
  end
end
