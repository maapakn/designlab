module Spree
	module Admin
		class CategoriesController < Spree::Admin::BaseController
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
		        format.html { redirect_to admin_categories_path, notice: 'La Categoria se ha creado.' }
		      else
		        format.html { render :new }
		        format.json { render json: @category.errors, status: :unprocessable_entity }
		      end
		    end
		  end

		  def update
		    respond_to do |format|
		      if @category.update(material_params)
		        format.html { redirect_to admin_category_path, notice: 'La Categoria se ha actualizado.' }
		        format.json { render :show, status: :ok, location: @material }
		      else
		        format.html { render :edit }
		        format.json { render json: @material.errors, status: :unprocessable_entity }
		      end
		    end
		  end

		  def destroy
		    @category.destroy
		    respond_to do |format|
		      format.html { redirect_to admin_categories_path, notice: 'La Categoria se ha eliminado.' }
		      format.json { head :no_content }
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
end