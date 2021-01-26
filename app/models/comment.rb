class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  # ALL_BLANK - FORM HELPER - PREVENT EMPTY RECORD - PROC - ***EXCLUDING _destroy****
  accepts_nested_attributes_for :user, reject_if: :all_blank

end
