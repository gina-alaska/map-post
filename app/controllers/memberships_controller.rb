class MembershipsController < ApplicationController
  before_action :fetch_membership, only: [:destroy, :show, :edit, :create, :update]
  
  def index
    @members = Membership.all
  end
  
  def show
    
  end
  
  def new
    @member = Membership.new
  end
  
  def create
    @member = Membership.new(membership_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, success: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: membership_path(@member) }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @member.update(membership_params)
        format.html { redirect_to membership_path(@member), success: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @member.destroy
    flash[:success] = "#{@member.email} was deleted"
    redirect_to memberships_path
  end
  
  protected
  
  def fetch_membership
    @member = Membership.find(params[:id]) if params[:id].present?
  end
  
  def membership_params
    params.require(:membership).permit(:email)
  end
end
