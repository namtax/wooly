class Vote < ActiveRecord::Base
  scope :counted,     -> { where("choice != '' and validity == 'during'") }
  scope :not_counted, -> { where("choice == '' or validity != 'during'") }

  def counted?
    self
    .class
    .counted
    .exists?(self.id)
  end
end
