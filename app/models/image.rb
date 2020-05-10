class Image < ApplicationRecord
  mount_uploaders :files, FileUploader
end
