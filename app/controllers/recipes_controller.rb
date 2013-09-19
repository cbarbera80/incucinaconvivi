class RecipesController < ApplicationController

  skip_before_filter :authorize, :only => [:index, :show, :search]



  def editRecipes
    @recipes = Recipe.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
      format.json {render :json => @recipes}
    end
  end

  # GET /recipes
  # GET /recipes.xml
  def index

    @recipes = Recipe.paginate :page=>params[:page], :order=>'created_at desc' ,
                             :per_page => 10
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
      format.json {render :json => @recipes}
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    #metodo per incrementare un contatore. In questo caso incremento di uno ogni volta che visualizzo
    #la ricetta per avere un contatore visite e poter stilare una classifica delle ricette più visitate
    @recipe.increment!(:viewed_time, 1)

     @directions = @recipe.directs.split('|') if @recipe.directs != nil

       respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  def search
    @recipes = Recipe.all(:conditions => "title like '%#{params[:s]}%'")
  end
  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(post_params)

    categories = Category.find(params[:categories])

    @recipe.categories << categories

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(edit_path, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    @category = Category.find(params[:categories])

    #//rimuovo tutte le categorie
    @recipe.categories.clear # unless !@recipe.categories.count.empty?


    @recipe.categories. << @category

    respond_to do |format|
      if @recipe.update_attributes(post_params)



        format.html { redirect_to(edit_path, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(edit_path, :notice => 'Recipe was successfully deleted.') }
      format.xml  { head :ok }
    end
  end

  def post_params
    params.require(:recipe).permit(:title, :description, :serving, :preparation_time, :directs, :categories, :image, :advice)
  end
end
