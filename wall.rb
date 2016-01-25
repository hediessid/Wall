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

  def compare_superior_rows(all_rows, row_level, level, height, count=0)
     # binding.pry
    while (level < height)
      if (level <height)
       result = compare_all_rows(all_rows,result)[0]
       compare_all_rows(all_rows,result)
        level += 1
      elsif (level == height)
        count+= compare_all_rows(all_rows,row_level)[0].count
      end    
    end
      puts count  
  end

  def compare_all_rows(all_rows,rows,count=0)
    hash_all_comparaison={}
    rows.each do |row|
      all_rows.each do |row_to_compare|
        if (row - row_to_compare)== row
          hash_all_comparaison[row]=row_to_compare
        end     
      end
      count+=hash_all_comparaison[row].count
    end
    return hash_all_comparaison,count
  end 

  def total_count(width, height)
    level = 2
    #binding.pry
    rows= all_rows = all_possibilities([3,4.5],[],[0]) 
    row_level = compare_all_rows(all_rows,rows)
    puts all_rows.count if height==1
    puts row_level[1] if height==2
    if height > 2

      puts compare_superior_rows(all_rows,row_level,level,height)
    end                        
  end
end 

wall = Wall.new(27,5,4.5,3)
wall.total_count(27,5)




