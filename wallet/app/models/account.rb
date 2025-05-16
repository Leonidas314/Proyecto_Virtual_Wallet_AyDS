class Account < ActiveRecord::Base
  belongs_to :user

  TIPOS = {
    cuenta_corriente: 0,
    cuenta_caja_ahorro: 1
  }.freeze

  validates :tipo, inclusion: { in: TIPOS.values }
  validates :balance, numericality: true

  def tipo_nombre
    TIPOS.key(self.tipo).to_s
  end

  def cuenta_corriente?
    self.tipo == TIPOS[:cuenta_corriente]
  end

  def cuenta_caja_ahorro?
    self.tipo == TIPOS[:cuenta_caja_ahorro]
  end
end
