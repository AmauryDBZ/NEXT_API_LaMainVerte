class Api::QueriesController < ApplicationController

  def index
      @input = params[:input].downcase
      @results = Hash.new
      @results["users"] = Array.new
      @results["gardens"] = Array.new

    if params[:input]

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

end
