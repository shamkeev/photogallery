class Photo < ActiveRecord::Base

  belongs_to :user

  has_many :comments

  validates :title, presence: true, length:{maximum: 50}
  validates :image, presence: true

  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg', 'image/png']
end
