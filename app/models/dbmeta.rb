Class DBMeta < ActiveRecord::Base

    attr_accessible :path, :is_dir, :size

    belongs_to :user

end
