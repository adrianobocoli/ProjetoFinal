class SessaoController < ApplicationController
  def new
  end

  def create
	 usuario = Usuario.where(:login => params[:sessao][:login].downcase).first
    if usuario && usuario.senha.to_s == (params[:sessao][:senha]).to_s
		log_in usuario
		params[:sessao][:remember_me] == '1' ? remember(usuario) : forget(usuario)
		remember usuario
		redirect_back_or usuario
	 else 
	 	flash[:danger] = 'Combinacao login/senha inválida!' # Not quite right!
	 	render 'new'
	 end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
