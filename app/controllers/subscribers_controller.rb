class SubscribersController < ApplicationController

  def index
    @subscribers = Subscriber.find(:all, :order=>'id DESC')
  end

  def create

    email = params[:email]

    s = Subscriber.new
    s.email = email

    respond_to do |format|
      if s.save
        format.html { redirect_to(recipes_path, :notice => "Grazie per esserti registrato alla nostra newsletter") }
      else
        format.html { redirect_to(recipes_path, :notice =>"Email esistente") }
      end
    end
  end

  def ship

    s = Subscriber.all

    s.each do |subscriber|
      @subscriber = subscriber
      Newsletter.welcome_email(@subscriber).deliver

    end
    respond_to do |format|
      format.html { redirect_to(recipes_path, :notice => "Newsletter in coda per l'invio") }
    end



  end

end
