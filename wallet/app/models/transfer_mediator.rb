class TransferMediator < ActiveRecord::Base
  self.table_name = "transfer_mediators"

  belongs_to :from_user, class_name: 'User', optional: true  # 👈 clave para permitir nil
  belongs_to :to_user, class_name: 'User'

  # Solo validamos el destino y el monto
  validates :to_user, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def self.transferir(from_user, to_user, amount)
    raise ArgumentError, "Usuario de origen inválido" unless from_user.is_a?(User)
    raise ArgumentError, "Usuario de destino inválido" unless to_user.is_a?(User)
    raise ArgumentError, "Los usuarios no pueden ser los mismos" if from_user == to_user
    raise ArgumentError, "Fondos insuficientes" if from_user.balance <= amount

    transaction do
      create!(from_user: from_user, to_user: to_user, amount: amount)
      from_user.update!(balance: from_user.balance - amount)
      to_user.update!(balance: to_user.balance + amount)
    end
  end

  def self.ingreso_sistema(to_user, amount)
    raise ArgumentError, "Usuario de destino inválido" unless to_user.is_a?(User)
    raise ArgumentError, "Monto inválido" unless amount.positive?

    transaction do
      create!(from_user: nil, to_user: to_user, amount: amount)
      to_user.update!(balance: to_user.balance + amount)
    end
  end
end