class PrayersController < ApplicationController
  before_filter :signed_in_user,        only: [:create, :destroy]
  before_filter :correct_user,          only: [:update, :destroy]

  def create
    @prayer = current_user.prayers.build( params[:prayer] )
    #logger.info( @prayer.inspect )

    if @prayer.save
      flash.now[:success] = 'Your prayer has been saved.'
    end

    redirect_to root_path
  end

  def update 
     if ( @prayer.update_attributes( params[:prayer] ) )
       flash.now[:notice] = 'You have updated your prayer'
       redirect_to root_path, :flash => { :notice => "You have updated your prayer" }
     else
       flash.now[:error] = 'Failed to save updated prayer information'
       redirect_to root_path, :flash => { :error => "Failed to save updated prayer information" }
     end

  end

  def destroy
  end


  private

   # If not signed in redirect to sign in
   def signed_in_user
     store_location     # from sessions_helper, store intended location
     redirect_to signin_path, notice: "Please sign in." unless signed_in?
   end

   # Make sure we have owner user to be able to take action on their keys
   def correct_user
     @prayer = current_user.prayers.find_by_id( params[:id] )
     redirect_to root_path if @prayer.nil?
   end

end
