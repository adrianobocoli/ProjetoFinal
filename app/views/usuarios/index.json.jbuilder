json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :login, :senha, :foto, :nomeCompleto, :cidade, :estado, :email, :descricaoPessoal
  json.url usuario_url(usuario, format: :json)
end
