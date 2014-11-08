class Usuario < ActiveRecord::Base
	validates :login, uniqueness: { case_sensitive: false, :message => "ja existe!"}
	validates_presence_of :login, :message => "não pode ser vazio!"
	validates_presence_of :senha, :message => "não pode ser vazio!"
	validates :senha, length: { minimum: 6, :message => "muito curta (minimo 6 caracteres)"}
	validates_presence_of :nomeCompleto, :message => "não pode ser vazio!"
	validates_presence_of :foto, :message => "não pode ser vazio!"
	validates_presence_of :cidade, :message => "não pode ser vazio!"
	validates_presence_of :estado, :message => "não pode ser vazio!"
	validates_presence_of :email, :message => "não pode ser vazio!"
	validates :email, uniqueness: { case_sensitive: false, :message => "ja existe!" }
	validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message => "inválido!"
	validates_presence_of :descricaoPessoal, :message => "não pode ser vazio!"
end
