class TransferMediator < ActiveRecord::Base
    # La relacionamos con la tabla anterior del mediator por ahora (renombrarla?)
    self.table_name = "transfer_mediators"

    belongs_to :from_user, class_name: 'User'
    belongs_to :to_user, class_name: 'User'

    validates :from_user, presence: true
    validates :to_user, presence: true
    validates :amount, numericality: { greater_than: 0 }

    def self.transferir(from_user, to_user, amount)

        puts "DEBUG from_user inspect:"
        puts from_user.inspect
        puts "DEBUG user finded by cbu:"
        puts to_user.inspect
      raise ArgumentError, "Usuario de origen inválido" unless from_user.is_a?(User)
      raise ArgumentError, "Usuario de destino inválido" unless to_user.is_a?(User)
      raise ArgumentError, "Los usuarios no pueden ser los mismas" if from_user == to_user
      raise ArgumentError, "Fondos insuficientes" if from_user.balance <= amount
      
      # transaction para seguridad
      transaction do
        create!(from_user: from_user, to_user: to_user, amount: amount)
        from_user.update!(balance: from_user.balance - amount)
        to_user.update!(balance: to_user.balance + amount)
      end
    end
  end