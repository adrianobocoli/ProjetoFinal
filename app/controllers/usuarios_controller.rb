class UsuariosController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :show]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Por favor! Logue para obter acesso a pagina!."
			redirect_to login_url
		end
	end

	def correct_user
      @user = Usuario.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

  # GET /usuarios
  # GET /usuarios.json
  def index
    if params[:search]
      @usuarios = Usuario.search(params[:search]).order("created_at DESC")
    else
      @usuarios = Usuario.order("created_at DESC")
    end
  end

	# GET /usuarios/random
	

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
		  flash[:success] = "Cadastro realizado com sucesso! Bem-vindo ao site!"
		  log_in @usuario
        format.html { redirect_to @usuario}
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

	def usuario_params
      params.require(:usuario).permit(:login, :senha, :nomeCompleto, :foto, :cidade, :estado, :email, :descricaoPessoal)
    end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(usuario_params)
		flash[:success] = "Dados alterados com sucesso!"
      redirect_to @usuario
    else
      render 'edit'
    end
      
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario excluido!"
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:login, :senha, :foto, :nomeCompleto, :cidade, :estado, :email, :descricaoPessoal)
    end
end
