class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses

    respond_to do |format|
      format.html
    end
  end

  def show
    @address = current_user.addresses.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @address = Address.new

    respond_to do |format|
      format.html 
      format.json { render json: @address }
    end
  end

  def edit
    @address = current_user.addresses.find(params[:id])
  end

  def create
    @address = Address.new(params[:address])
    current_user.addresses << @address

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @address = current_user.addresses.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @address = current_user.addresses.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url }
    end
  end
end
