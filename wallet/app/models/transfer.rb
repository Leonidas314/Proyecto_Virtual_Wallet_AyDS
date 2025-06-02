class Transfer < ActiveRecord::Base
    # La relacionamos con la tabla anterior del mediator por ahora (renombrarla?)
    self.table_name = "transfer_mediators"

    belongs_to :from_account, class_name: 'Account'
    belongs_to :to_account, class_name: 'Account'

    validates :from_account, presence: true
    validates :to_account, presence: true
    validates :amount, numericality: { greater_than: 0 }
  
    def self.transferir(from_account, to_account, amount)
      raise ArgumentError, "Cuenta origen inválida" unless from_account.is_a?(Account)
      raise ArgumentError, "Cuenta destino inválida" unless to_account.is_a?(Account)
      raise ArgumentError, "Las cuentas no pueden ser las mismas" if from_account == to_account
      raise ArgumentError, "Fondos insuficientes" if from_account.balance < amount
      
      # transaction para seguridad
      transaction do
        create!(from_account: from_account, to_account: to_account, amount: amount)
        from_account.update!(balance: from_account.balance - amount)
        to_account.update!(balance: to_account.balance + amount)
      end
    end
  end
  