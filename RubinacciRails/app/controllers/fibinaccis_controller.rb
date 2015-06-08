class FibinaccisController < ApplicationController

  # I'm going to try caching the calculated values, although I'm not sure
  # why we'd do this, as the string processing would seem to outweigh the
  # actual calculation. I guess it would make sense if we were only going
  # to look at the last value (f(n)). If we want to output the whole 
  # series, I wonder if it would be smarter to cache the strings. Then we'd
  # be doing to_i on 2 string values, instead of to_s on who-knows-how-many
  # integer values. I believe that is what I'll do, since the assignment is
  # to put out the whole series. Not sure I understand enough about strings
  # or arrays in Ruby to know if this is saving much, either. But for sure
  # it won't be repeating calculations.
  
  @@cache = ["0", "1"]
  
  def new
  end
  
  
  def create
    @n = params[:fibinacci][:enter_n].to_i
    if @n < 0
    	@ans = "Error"
    	render :new
    	return
    end
    
    i = 0
    @ans = ""
    while (i < @@cache.length && i <= @n) do
      @ans << @@cache[i]
      @ans << " "
      i += 1
    end
    
    if i > @n
      #@ans << " (saved strings only)"
      render :new
      return
    end
    
    # Get the last 2 values from the array.
    # There will always be at least 2, because that's how I initialized it.
    p2 = @@cache[@@cache.length - 2].to_i
    p1 = @@cache[@@cache.length - 1].to_i
    
    while i <= @n do
      curr = p2 + p1
      @@cache.push(curr.to_s)
      @ans << @@cache[i]
      @ans << " "
      p2 = p1
      p1 = curr
      i += 1
    end
    render :new
  end
end
