require 'pry'

class Wall
  
  def initialize(width,height,bigBrick,smallBrick)
    @width = width
    @height = height
    @bigBrick = bigBrick
    @smallBrick = smallBrick
  end

  def all_possibilities(bricks, possibilities, row_in_progress)
    if (@width%3)== 0       
      bricks.each do |brick|
        lastPosition = row_in_progress[-1]
        nextPosition = lastPosition+brick
        if lastPosition == @width
          return possibilities.push(row_in_progress[1...-1]) 
        end
        if nextPosition <= @width
          next_guess = row_in_progress + [nextPosition]
          all_possibilities(bricks,possibilities, next_guess)
        end
      end
      return possibilities
    end
  end

  def compare_all_rows(all_rows,count)
    #need to change to hash in hash
    hash_all_comparaison={}
    all_rows.each do |row|
      all_rows.each do |row_to_compare|
        if (row - row_to_compare)== row
          hash_all_comparaison[row]=row_to_compare
        end     
      end
      count+=hash_all_comparaison[row].count
    end
    return hash_all_comparaison,count
  end 

  def total_count(width, height, count=0)
    all_rows = all_possibilities([3,4.5],[],[0]) 

        if(height == 1)
          return all_rows.count
        elsif (height == 2)
          puts compare_all_rows(all_rows,count)[0]
        else 
          # while (height>)
          # height-=height
        end
                 
  end

end 

wall = Wall.new(27,5,4.5,3)
wall.total_count(27,2,0)




