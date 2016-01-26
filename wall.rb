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
  def compare_superior_rows(all_row, row_level, level, height)
    hash={}
    binding.pry
    while (level <= height)  
      if (level==height)
        puts hash
      else
        hash.values.flatten(1).each do |array|
          if ((hash.empty? == true) || (hash.has_key?(array)==false))
             hash[level]=[row_level[array]]
             binding.pry
          else
            binding.pry
            hash[level].push([row_level[array]])           
          end        
        end 

      end 
    level+=1
    end
  end

  def compare_all_rows(all_rows,rows)
    hash={}
    all_rows.each do |row|
      rows.each do |row_to_compare|
        if (row - row_to_compare)== row
          if ((hash.empty? == true) || (hash.has_key?(row)==false)) 
            hash[row]=[row_to_compare]
          else
            hash[row].push(row_to_compare) 
          end  
        end     
      end
    end 
    return hash
  end 

  def total_count(width, height)
    level = 2
    count = 0
    rows = all_rows = all_possibilities([3,4.5],[],[0])
    all_rows_level = compare_all_rows(all_rows, rows)
    all_rows_level1 = all_rows_level.values.flatten(1)

    all_rows_level1.each do |value|
      count+= value.count
    end 
    rows.count if height == 1
    puts all_rows_level1.count if height == 2 
    if height > 2 
      compare_superior_rows(rows, all_rows_level, level, height)
    end                     
  end
end 

wall = Wall.new(9,3,4.5,3)
wall.total_count(9,3)




