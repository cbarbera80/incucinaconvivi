class Category < ActiveRecord::Base
  def to_param
    "#{id} #{description}".parameterize
  end

  has_and_belongs_to_many :recipes
  has_attached_file :image,
                    :url => '/images/categories/:id_:style.:extension',
                    :path => 'public/images/categories/:id_:style.:extension',
                    :styles => {  :thumb => "72x72>" }
end