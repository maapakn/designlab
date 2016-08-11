module Spree	
	class ZonasController < Spree::StoreController
		before_action :set_zona, only: [:show, :edit, :update, :destroy]


		  def index
		    @zona = Zona.all
		  end

		  def show
		  end

		  def new
		    @zona = Zona.new
		  end

		  def create
		    @zona = Zona.new(trabajo_params)

		    respond_to do |format|
		      if @zona.save
		        format.html { redirect_to @zona, notice: 'Zona was successfully created.' }
		      else
		        format.html { render :new }
		        format.json { render json: @zona.errors, status: :unprocessable_entity }
		      end
		    end
		  end
		  private
		  	def set_category
		      @zona = Zona.find(params[:id])
		    end
		    # Never trust parameters from the scary internet, only allow the white list through.
		    def trabajo_params
		      params.require(:zona).permit(:nombre)
		    end
	end
end