class DetailsController < ApplicationController

  def index
    @details = activity.details

    respond_to do |format|
      format.html
    end
  end

  def show
    @detail = activity.find(params[:activity_id]).details.find(:id)

    respond_to do |format|
      format.html
    end
  end

  def new
    @detail = Detail.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @detail = activity.details.find(params[:id])
  end

  def create
    @detail = Detail.new(params[:detail])
    activity.details << @detail

    respond_to do |format|
      if @detail.save
        format.html { redirect_to @detail, notice: 'Detail was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @detail = activity.details.find(params[:id])

    respond_to do |format|
      if @detail.update_attributes(params[:detail])
        format.html { redirect_to @detail, notice: 'Detail was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @detail = activity.details.find(params[:id])
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to details_url }
    end
  end
  private

  def activity
    return current_user.activities.find(params[:activity_id])
  end
end
