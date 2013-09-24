class IngredientsController < ApplicationController
  # GET /ingredients
  # GET /ingredients.xml
  def index

    @ingredients = Ingredient.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingredients }
    end
  end

  # GET /ingredients/1
  # GET /ingredients/1.xml
  def show

    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredient }
    end
  end

  # GET /ingredients/new
  # GET /ingredients/new.xml
  def new

    # @recipe =  Recipe.find(params[:recipe_id])
    # @ingredient = @recipe.ingredients.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ingredient }
    end
  end

  # GET /ingredients/1/edit
  def edit

    @ingredient = Ingredient.find(params[:id])
  end

  # POST /ingredients
  # POST /ingredients.xml
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(post_params  )



    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to(edit_recipe_path(@recipe), :notice => 'Ingredient was successfully created.') }
        format.xml  { render :xml => @ingredient, :status => :created, :location => @ingredient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingredients/1
  # PUT /ingredients/1.xml
  def update
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      if @ingredient.update_attributes(params[:ingredient])
        format.html { redirect_to(@ingredient, :notice => 'Ingredient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.xml
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to(edit_recipe_path(@recipe)) }
      format.xml  { head :ok }
    end
  end

  def post_params
    params.require(:ingredient).permit(:description, :recipe_id, :quantity, :allow_scale)
  end
end
