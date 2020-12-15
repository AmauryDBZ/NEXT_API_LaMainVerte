class Api::QueriesController < ApplicationController

    def index
        @results = Hash.new
        @results["users"] = Array.new
        @results["gardens"] = Array.new

        if params[:input]
            @input = params[:input].downcase

            User.all.each do |user|
                if user.username.downcase.include? params[:input]
                    @results["users"] << user
                end
            end

            @results["users"] = relevance_sort_results(@results["users"], @input, "users")

            Garden.all.each do |garden|
                if garden.name.downcase.include? params[:input]
                    @results["gardens"] << garden 
                end
            end

						@results["gardens"] = relevance_sort_results(@results["gardens"], @input, "gardens")
				end

        if params[:news_feed] == "visitor"
            @results["gardens"] = new_user_feed
						@results["users"] = displayed_users
				end
				
				if params[:follows_page]
					index1 = params[:follows_page].to_i * 10 - 10
					index2 = index1 + 9
					@results["users"] = @results["users"][index1 .. index2]
					@results["gardens"] = @results["gardens"][index1 .. index2]
				else                           
					@results["users"] = @results["users"][0..9]
					@results["garden"] = @results["gardens"][0..9]
				end
				
       render json: @results
    end


    private

    def relevance_sort_results(array, input, type)
        array_length = array.size

        loop do
            swapped = false

            (array_length-1).times do |i|
                score1 = 0
                score2 = 0
                counter = 0

                input.split(//).each do
                    if type == "users"
                        if array[i].username[counter] == input[counter]
                            score1 += 1
                        end

                        if array[i + 1].username[counter] == input[counter]
                            score2 += 1
                        end
                    else
                        if array[i].name[counter] == input[counter]
                            score1 += 1
                        end

                        if array[i + 1].name[counter] == input[counter]
                            score2 += 1
                        end
                    end


                    counter +=1
                end

                if score2 > score1
                    array[i], array[i+1] = array[i+1], array[i]
                    swapped = true
                end
            end

            break if not swapped
        end

        return array

    end

    def new_user_feed
        return showed_gardens = Garden.all.sort{|a,b| b.follows.length <=> a.follows.length}
    end

    def displayed_users
        displayed_users_array = Array.new
				global_scores = Hash.new

					User.all.each do |user|
						score = 0
						user.gardens.each do |garden|
							score += garden.follows.length
						end
						global_scores[user.id] = score
					end

					sorted_users = Array.new
					displayed_users_array = global_scores.sort_by(&:last).reverse

					displayed_users_array.each do |user|
						sorted_users << User.find(user[0])
					end

			return sorted_users
    end
end