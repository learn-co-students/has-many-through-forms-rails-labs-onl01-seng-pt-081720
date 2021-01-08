class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  #this method does not prevent duplicated from being created
  # accepts_nested_attributes_for :categories, reject_if: :all_blank

  #what the accepts_nested_attributes_for method is doing behind the scenes
  #creating or finding a category, but if its blank let the post be created without a new category
  # # *will not create duplicates!
  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      if !category_attribute[:name].blank?
        #if i pass in find or create with key/value method doesnt seem to work and allows duplication
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end
end
