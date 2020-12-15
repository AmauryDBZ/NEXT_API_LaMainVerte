class Garden < ApplicationRecord
  # ASSOCIATIONS
  has_many :garden_tags
  has_many :tags, through: :garden_tags
  has_many :garden_comments
  has_many :posts
  belongs_to :garden_type
  belongs_to :climate
  belongs_to :location
  has_many :follows
  belongs_to :user
  has_many :events
  has_many :garden_likes

  # VALIDATIONS
  validates :name, presence: true

  def self.filter(params)
    
    if (params.keys.length() > 2)
      int_params = ["user_id", "location_id", "climate_id", "garden_type_id"]
      like_params = ["description", "name"]
      query_parts = []

      params.each do |k, v|
        if (k != "action" && k != "controller")
          if (like_params.include?(k))
            query_parts.push("#{k} LIKE '%#{v}%'")
          elsif int_params.include?(k)
            query_parts.push("#{k}=#{v}")
          end
        end
      end

      query_string = query_parts.join(" AND ")

      return Garden.where(query_string)
    else
      return Garden.all
    end
  end
end
