class Promo < ApplicationRecord

  before_save :set_active

  private
  def set_active
     if self.active?
       Promo.update_all(active: false)
     end
  end
end
