class CategoriesController < ApplicationController
  skip_before_filter :authorize, :only => [:show]

  def index
   @categories = Category.find(:all, :order=>'description')
 end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @recipes = Category.find(params[:id]).recipes

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new

    @category = Category.new

    respond_to do |format|
      format.html
      format.xml {render :xml => @category}

    end
  end

  # POST /categories
  # POST /categories.xml
  def create
         @category = Category.new(post_params)

         respond_to do |format|

           if @category.save
             format.html { redirect_to(recipes_path, :notice => 'Category was successfully created.') }
             format.xml  { render :xml => @category, :status => :created, :location => @category }
           else
             format.html { render :action => "new" }
             format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
           end
         end
  end

 def post_params
   params.require(:category).permit(:description)
 end
end
