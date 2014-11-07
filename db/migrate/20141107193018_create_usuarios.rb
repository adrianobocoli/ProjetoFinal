class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :login
      t.string :senha
      t.string :foto
      t.string :nomeCompleto
      t.string :cidade
      t.string :estado
      t.string :email
      t.string :descricaoPessoal

      t.timestamps
    end
  end
end
