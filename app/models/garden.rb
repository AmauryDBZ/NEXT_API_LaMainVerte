class Garden < ApplicationRecord
  # ASSOCIATIONS
  has_many :garden_tags, dependent: :destroy
  has_many :tags, through: :garden_tags
  has_many :garden_comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  belongs_to :garden_type
  belongs_to :climate
  belongs_to :location
  has_many :follows, dependent: :destroy
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :garden_likes, dependent: :destroy

  # VALIDATIONS
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true


  def self.filterByGardenAttributes(params)
    if (params.keys.length() > 2)
      query_string = self.parseQueryStringToQuery(params)

      return Garden.where(query_string).limit(20)
    else
      return Garden.all.limit(10)
    end
  end

  def self.filterByTagid(params)
    query_string = self.parseQueryStringToQuery(params)

    query = "INNER JOIN garden_tags ON garden_tags.garden_id = gardens.id INNER JOIN tags ON tags.id = garden_tags.tag_id WHERE tags.id=#{params[:tag_id]}"

    if (query_string != "")
      query += "AND #{query_string}"
    end
    return Garden.joins(query)
  end

  private

  def self.parseQueryStringToQuery(params)
    int_params = ["user_id", "location_id", "climate_id", "garden_type_id"]
    like_params = ["description", "name"]
    query_parts = []
    params.each do |k, v|
      if (k != "action" && k != "controller")
        if (like_params.include?(k))
          query_parts.push("gardens.#{k} LIKE '%#{v}%'")
        elsif int_params.include?(k)
          query_parts.push("gardens.#{k}=#{v}")
        end
      end
    end
    query_string = query_parts.join(" AND ")

    return query_string
  end
end
