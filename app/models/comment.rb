class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #user is leaving a comment, set nested attribute for user
  #if all_blank goes through each attribute of the user object, will check them and make sure that
  #it's not blank, and if it is it won't create the comment so that we don't have a comment without a user
  accepts_nested_attributes_for :user, reject_if: :all_blank
end
