class AvatarUploader < CarrierWave::Uploader::Base
  storage :file
  root ""
end