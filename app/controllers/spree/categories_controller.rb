module Spree
	class CategoriesController < Spree::StoreController
		before_action :set_category, only: [:show, :edit, :update, :destroy]


	  def index
	    @category = Category.all
	  end

	  def show
	  end

	  def new
	    @category = Category.new
	  end

	  def create
	    @category = Category.new(trabajo_params)

	    respond_to do |format|
	      if @category.save
	        format.html { redirect_to @category, notice: 'Category was successfully created.' }
	      else
	        format.html { render :new }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
	    end
	  def destroy
	    @category.destroy
	    respond_to do |format|
	      format.html { redirect_to @category, notice: 'Diente was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end
	  end
	  private
	  	def set_category
	      @category = Category.find(params[:id])
	    end
	    # Never trust parameters from the scary internet, only allow the white list through.
	    def trabajo_params
	      params.require(:category).permit(:nombre)
	    end
	end
end