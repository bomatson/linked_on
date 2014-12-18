class User < ActiveRecord::Base
  belongs_to :organization

  has_and_belongs_to_many :occupations

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  scope :employed, -> { where('organization_id IS NOT NULL') }

  def unemployed?
    occupations.empty?
  end

  def occupation_names
    occupations.map do |occupation|
      occupation.title
    end
  end
end
