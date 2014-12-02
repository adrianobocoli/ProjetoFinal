class Usuario < ActiveRecord::Base
	attr_accessor :remember_token
	
	def self.search(query)
  		where("lower(nomeCompleto) LIKE lower(?)", "%#{query}%") 
	end
  
  def remember
    self.remember_token = Usuario.new_token
    update_attribute(:remember_digest, Usuario.digest(remember_token))
  end

	mount_uploader :foto, PictureUploader
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
	validate :foto_size

	def Usuario.new_token
    SecureRandom.urlsafe_base64
  end

	def foto_size
      if foto.size > 5.megabytes
        errors.add(:foto, "deve ser menor que 5MB")
      end
    end

	def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

	def forget
    update_attribute(:remember_digest, nil)
  end

	def Usuario.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
