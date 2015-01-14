class UsersController < ApplicationController
 

   def show
   	@user = User.find(params[:id])
   end

  
  def new
  	@user = User.new
  end
   
  
#  def create
#    p user_params.inspect
#    redirect_to root_path and return
#    # Parameters: {"utf8"=>"✓", "authenticity_token"=>"5fvdZUhFuQbzuZXpL4Zq/OgKKizB63FY3+ii+8DOE6ImE8TOpCveAx56Rrt9KOgCJZE/MG6X8HXQu7suT1/P0Q==", "user"=>{"first_name"=>"joe", "email"=>"joe@joe.com", "password"=>"[FILTERED]"}, "commit"=>"Sign up!"}
#    # "{\"first_name\"=>\"joe\", \"email\"=>\"joe@joe.com\", \"password\"=>\"joe\"}"
#
#
#     @user = User.new(user_params)
#     if @user.save
#       flash[:success] = "Welcome! You are now signed up!"
#       redirect_to @user
#     else
#       render 'new'
#     end
#  end


  def destroy
    @user = User.find(params[:id])
     if @user.destroy
       flash[:success] = "Success!"
       redirect_to root_path
     else
       render 'edit'
     end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end