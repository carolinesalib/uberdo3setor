class Ngo < ApplicationRecord
  include Paperclip::Glue
  include PhoneFormat

  has_attached_file :image, styles: { medium: '320x320#', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :actived, -> { where(active: true) }

  def phone_number1=(text)
    super(only_numbers text)
  end

  def phone_number2=(text)
    super(only_numbers text)
  end
end
