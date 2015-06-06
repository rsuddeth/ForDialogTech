class Rubinacci
   @@size = -1
   def initialize n
      @size = n.to_i
      @p2 = 0
      @p1 = 1
   end
   
   def run
      if @size < 0
         puts "The number of entries must be greater than zero"
      end
      # If we get here, we're printing the sequence. Zero is special
      # case, since it can't use the 2 previous.
      print 0
      print ' '
      i = 1;
      while i < @size do
        i = i + 1
      	curr = (@p2 + @p1)
      	print curr
      	print ' '
      	@p2 = @p1
      	@p1 = curr
      end
      puts (@p2 + @p1)     
   end
   
end


def help
  print " 
  Please pass in the number of entries you want to see.

  Usage: #{__FILE__} n
" 
end

if ARGV.empty?
  help
  exit
end

target = ARGV[0]
r = Rubinacci.new target

r.run  
