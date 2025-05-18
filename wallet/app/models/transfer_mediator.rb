class TransferMediator < ActiveRecord::Base
    belongs_to :from_account, class_name: 'Account'
    belongs_to :to_account, class_name: 'Account'
  
    validates :amount, numericality: { greater_than: 0 }
  
    # Método para transferir un monto de una cuenta a otra
    def self.transferir(from_account, to_account, amount)
      transaction do
        raise "Fondos insuficientes" unless debitar(from_account, amount)
        acreditar(to_account, amount)
  
        create!(from_account: from_account, to_account: to_account, amount: amount)
      end
    rescue => e
      puts "Error en transferencia: #{e.message}"
      false
    end
  
    # Método para debitar el monto de la cuenta origen
    def self.debitar(account, amount)
      if account.balance >= amount
        account.balance -= amount
        account.save!
        true
      else
        false
      end
    end
  
    # Método para acreditar el monto en la cuenta destino
    def self.acreditar(account, amount)
      account.balance += amount
      account.save!
    end
  end
  