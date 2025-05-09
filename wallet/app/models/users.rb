class User
  def generate_unique_cvu
    base_number = User.maximum(:id).to_i + 1
    self.cvu = base_number.to_s.rjust(22, '0')
  end
end