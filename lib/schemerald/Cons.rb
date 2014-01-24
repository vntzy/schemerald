class Cons
	attr_reader :car, :cdr

	def initialize(car, cdr)
		@car = car
		@cdr = cdr
	end
end