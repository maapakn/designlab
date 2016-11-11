module Spree
	class ReportesController < Spree::StoreController
	  before_action :authenticate_spree_user!

	  def reportes
	  	@taxonomies = Spree::Taxonomy.includes(root: :children)
	  end

	  def fecha
	  	@taxonomies = Spree::Taxonomy.includes(root: :children)
	  end

	  def paciente
	  	@taxonomies = Spree::Taxonomy.includes(root: :children)
	  	@pedidos = current_spree_user.pedidos.where(estado_pago: 2).order('apellidos')
	  end

	  def material
	  	@taxonomies = Spree::Taxonomy.includes(root: :children)
	  	fecha_actual = Time.current.to_s
	  	fecha_anterior = 6.month.ago.to_s
	  	@pedidos = current_spree_user.pedidos.where("estado_pago = 2").joins(:material).select('distinct on (nombre) *')
	  	@grafico = current_spree_user.pedidos.where("estado_pago = 2 AND created_at BETWEEN ? AND ?",fecha_anterior,fecha_actual).group_by_month_of_year(:created_at, format: "%B").count
	  end

	  def trabajo
	  	@taxonomies = Spree::Taxonomy.includes(root: :children)
	  	@trabajo = Spree::Trabajo.all
	  	fecha_actual = Time.current.to_s
	  	fecha_anterior = 6.month.ago.to_s
	  	@grafico = current_spree_user.pedidos.where("estado_pago = 2 AND created_at BETWEEN ? AND ?",fecha_anterior,fecha_actual).group_by_month_of_year(:created_at, format: "%B").count
	  	@pedidos = current_spree_user.pedidos.where("estado_pago = 2").joins(:trabajo).select('distinct on (nombre) *')
	  end

	  def gasto
	  	@taxonomies = Spree::Taxonomy.includes(root: :children)
	  	fecha_actual = Time.current.to_s
	  	fecha_anterior1 = 1.month.ago.to_s
	  	fecha_anterior = 6.month.ago.to_s
	  	fecha_febrero = 
	  	@grafico = current_spree_user.pedidos.joins(:material).where("spree_pedidos.estado_pago = 2 AND spree_pedidos.created_at BETWEEN ? AND ?",fecha_anterior1,fecha_actual).group_by_month_of_year("spree_pedidos.created_at", format: "%B").sum("spree_materials.precio")
	  	@grafico2 = current_spree_user.pedidos.joins(:material).where("spree_pedidos.estado_pago = 2 AND spree_pedidos.created_at BETWEEN ? AND ?",fecha_anterior,fecha_actual).group_by_month_of_year("spree_pedidos.created_at", format: "%B").sum("spree_materials.precio")
	  	#@grafico3 = current_spree_user.pedidos.joins(:material).where("spree_pedidos.estado_pago = 2 AND spree_pedidos.created_at ?",fecha_febrero).group_by_month_of_year("spree_pedidos.created_at", format: "%B").sum("spree_materials.precio")
	  end
	end
end
#@tweets_count = Tweet.group(:user_id).count
#@tweets_count = User.includes(:tweets).group("tweets.user_id").pluck("users.name, count(tweets.id)")
#User.joins("left join tweets on users.id = tweets.user_id").group("users.id, tweets.user_id").select("users.*, count(tweets.id) as cuenta_tweets").collect{|x| [x.name, x.cuenta_tweets]}

#@grafico = Spree::Pedido.group(:trabajo_id).count
#@grafico = Spree::Trabajo.includes(:pedidos).group("spree_pedidos.trabajo_id").pluck("spree_trabajos.nombre, count(spree_pedidos.id)")
#@grafico = Spree::Trabajo.joins("left join spree_pedidos on spree_trabajos.id = spree_pedidos.trabajo_id").group("spree_trabajos.id, spree_pedidos.trabajo_id").select("spree_trabajos.*, count(spree_pedidos.id) as cuenta_pedido").collect{|x| [x.nombre, x.cuenta_pedido]}
