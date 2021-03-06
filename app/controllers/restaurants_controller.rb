class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


  before_action :authenticate_user!, except: [:search, :index, :show]

  before_action :check_user, except: [:search, :index, :show]
  #Everyone should be able to look at the index page, and the individual restaurants' Show pages...


  

#*******************    SEARCH FUNCTIONALITY  ****************************
  def search
    if params[:search].present? #IF SEARCH TERMS ENTERED....
      @restaurants = Restaurant.search(params[:search])   #SEARCH restaurants Database for matching terms...
    else  # These matches are stored in a variable called "@restaurants"
      @restaurants = Restaurant.all  #If search was left blank, just display all restaurants in our Database!!!
    end
  end
#*******************    SEARCH FUNCTIONALITY  ****************************
# Now we need to write our own Search page view to display the results....search.html.erb









  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    #@restaurants = Restaurant.order(date: :desc).page(params[:page]).per(5)
    
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    #@restaurants = Restaurant.all
    #defining @reviews and showing review for the restaurant
    @reviews = Review.where(restaurant_id: @restaurant.id).order("created_at DESC")
    #take all our restaurant ratings, average them, round to 2 decimal places.
    # BUT, if there aren't any reviews, it won't have anything to average, and 
    # will give us an error. so we need to say if.....
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end


  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end



    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end







    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone, :website, :image)
    end
end
