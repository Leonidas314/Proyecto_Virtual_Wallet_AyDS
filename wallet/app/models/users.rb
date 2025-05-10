class User < ActiveRecord::Base
  has_secure_password #Hashea el password y genera password (para establecer la contraseña) y authenticate (para verificar la contraseña).

  before_create :generate_unique_cvu

  def generate_unique_cvu
    base_number = User.maximum(:id).to_i + 1
    self.cvu = base_number.to_s.rjust(22, '0')
  end
end