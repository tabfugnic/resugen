class ActivitiesController < ApplicationController
  
  def index
    @activities = current_user.activities
    respond_to do |format|
      format.html 
    end
  end

  def show
    @activity = current_user.activities.find(params[:id])
    respond_to do |format|
      format.html 
    end
  end

  def new
    @activity = params[:type].constantize.new 
    #TODO: This desperately needs to be changed
    5.times { @activity.details.build }
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @activity = current_user.activities.find(params[:id])
    (5 - @activity.details.count).times { @activity.details.build }
  end

  def create
    @activity = params[:type].constantize.new(params[:activity])
    # I thought this was supposed to be destructive
    @activity.details.keep_if { |d| p d; p d.content; p d.content.present?; d.content.present? }
    current_user.activities << @activity

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @activity = current_user.activities.find(params[:id])
    @activity.details.keep_if { |d| d.content.present? }

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
    end
  end
end
