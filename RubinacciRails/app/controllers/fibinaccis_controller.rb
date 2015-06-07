class FibinaccisController < ApplicationController
  def new
  end
  
  def create
    @n = params[:fibinacci][:enter_n].to_i
    if @n < 0
    	@ans = "Error"
    	render :new
    	return
    end
    	
    @ans = "0 "
    p2 = 0;
    p1 = 1;
    i =1;
    while i < @n do
      i += 1
      curr = p2 + p1
      @ans << curr.to_s
      @ans << " "
      p2 = p1
      p1 = curr
    end
    render :new
  end
end
