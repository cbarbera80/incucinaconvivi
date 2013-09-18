class Recipe < ActiveRecord::Base


  has_many :ingredients, :dependent => :destroy
  has_and_belongs_to_many :categories

  validates :title, :directs, :description,   :serving, :preparation_time, :presence => true
  validates :serving, :inclusion => 1..5
  validates :title, :uniqueness => true

  has_attached_file :image,
                    :url => '/images/sample-food/:id_:style.:extension',
                    :path => 'public/images/sample-food/:id_:style.:extension',
                    :styles => { :medium => "300x220>", :thumb => "72x72>" }

end
