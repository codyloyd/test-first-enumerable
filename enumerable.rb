module Enumerable
  def my_each
    i = 0
    while i < self.length
    	yield(self[i])
    	i += 1
    end
    self
  end

  def my_each_with_index
  	i = 0
  	while i < self.length
  		yield(self[i],i)
  		i += 1
  	end
  	self
  end

  def my_select
  	ary = []
  	i = 0
  	while i < self.length
  		ary << self[i] if yield(self[i])
  		i += 1
  	end
  	ary
  end

  def my_all?
  	i = 0
  	while i < self.length  		
  		if block_given?
  			return false unless yield(self[i])
  		else
	  		return false unless self[i]
	  	end
  		i += 1
  	end
  	return true
  end

  def my_any?
  	i = 0
  	while i < self.size
  		if block_given?
  			return true if yield(self[i])
		else
	  		return true if self[i]
	  	end
  		i+=1
  	end
  	return false
  end

  def my_none?
  	i = 0
  	while i < self.size
  		if block_given?
  			return false if yield(self[i])
  		else
  			return false if self[i]
  		end
  		i+=1
  	end
  	return true
  end

  def my_map
  	i = 0
  	ary = []
  	while i < self.size
  		ary << yield(self[i])
  		i +=1
  	end
  	ary
  end

  def my_count
  	if block_given?
  		count = 0
  		i = 0
  		while i < self.size
  			count += 1 if yield(self[i])
  			i+=1
  		end
  		return count
  	else
	  	return self.size
  	end
  end

  def my_inject(arg1=nil,arg2=nil)
  	if arg1 == nil
	  	if block_given?
	  		i = 1
	  		result = self[0]
	  		while i < self.size
	  			result = yield(result,self[i])
	  			i+=1
	  		end
	  		return result
	  	end
	else
		
	end
  end
end