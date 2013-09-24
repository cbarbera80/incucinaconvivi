class Recipe < ActiveRecord::Base

  def to_param
    "#{id} #{title}".parameterize
  end


  attr_writer :current_serving

  def current_serving
    @current_serving || self.serving
  end


  has_many :ingredients, :dependent => :destroy
  has_and_belongs_to_many :categories

  def current_serving_scaled
    self.current_serving.to_f / self.serving.to_f
  end

  validates :title, :directs, :description,   :serving, :preparation_time, :presence => true
  validates :serving, :inclusion => 1..10
  validates :title, :uniqueness => true

  has_attached_file :image,
                    :url => '/images/sample-food/:id_:style.:extension',
                    :path => 'public/images/sample-food/:id_:style.:extension',
                    :styles => { :medium => "300x220>", :thumb => "72x72>" }

end
