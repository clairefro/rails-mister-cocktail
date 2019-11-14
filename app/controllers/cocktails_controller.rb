class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit]
  # GET "cocktails"
  def index
    @cocktails = Cocktail.all
  end

  # GET "cocktails/:id"
  def show
    @doses = @cocktail.doses
  end

  # GET "cocktails/new"
  def new
    @cocktail = Cocktail.new
  end

  # POST "cocktails"
  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
