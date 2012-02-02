require "lib/avatar_uploader"

class User
  include ActiveModel::Validations
  extend CarrierWave::Mount

  mount_uploader :avatar, AvatarUploader
end

class UserWithInvalidValidation < User
  validates :avatar, :dimensions => true
end

class UserWithInvalidValitionHeightOptions < User
  validates :avatar, :dimensions => {
    :height => {},
    :width => { :minimum => 200, :maximum => 200 }
  }
end

class UserWithInvalidValitionWidthOptions < User
  validates :avatar, :dimensions => {
    :width => {},
    :height => { :minimum => 200, :maximum => 200 }
  }
end

class UserMinimumWidth200 < User
  validates :avatar, :dimensions => {
    :width => { :minimum => 200 }
  }
end

class UserMinimumHeight200 < User
  validates :avatar, :dimensions => {
    :height => { :minimum => 200 }
  }
end

class UserMaximumWidth200 < User
  validates :avatar, :dimensions => {
    :width => { :maximum => 200 }
  }
end

class UserMaximumHeight200 < User
  validates :avatar, :dimensions => {
    :height => { :maximum => 200 }
  }
end

class UserMinimumDimensions100 < User
  validates :avatar, :dimensions => {
    :height => { :minimum => 100 },
    :width => { :maximum => 100 }
  }
end