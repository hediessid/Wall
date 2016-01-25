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
  # need to use the first array that we create from comparaison 
  def compare_superior_rows(all_rows, row_level, level, height, count=0)
     binding.pry
    while (level <= height)
      if ((level == 2 )&&(height==2))
        return compare_all_rows(all_rows,row_level).count
      elsif (level == height)
        count+= compare_all_rows(all_rows,row_level).count
       else
        level += 1
        row_level = compare_all_rows(all_rows,row_level)
        compare_superior_rows(all_rows,row_level,level,height) 
      end    
    end
      puts count  
  end

  def compare_all_rows(all_rows,rows)
    array=[]
    all_rows.each do |row|
      rows.each do |row_to_compare|
        if (row - row_to_compare)== row
          array.push(row)
        end     
      end
    end
    return array
  end 

  def total_count(width, height)
    level = 1
    #binding.pry
    rows= all_rows = all_possibilities([3,4.5],[],[0]) 
    puts all_rows.count if height==1
    if height >= 2
      puts compare_superior_rows(all_rows,rows,level,height)
    end                        
  end
end 

wall = Wall.new(27,5,4.5,3)
wall.total_count(27,5)




