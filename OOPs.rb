#OOPs.rb
class Beatles
	attr_accessor :name, :nickname

	def initialize(name, nickname)
		@name = name
		@nickname = nickname
	end

	def intro
		puts "Hi, I'm #{@name}!  I'm #{@nickname}!"
	end	
end

john = Beatles.new("John Lennon", "The Smart One")
paul = Beatles.new("Paul McCartney" , "The Cute One")
george = Beatles.new("George Harrison" , "The Quiet One")
ringo = Beatles.new("Ringo Starr" , "The Shy One")

john.intro	
paul.intro
george.intro
ringo.intro

# beatles = [
#   {
#     name: "nil",
#     nickname: "The Smart One"
#   },
#   {
#     name: "nil",
#     nickname: "The Shy One"  
#   },
#   {
#     name: "nil",
#     nickname: "The Cute One"
#     },
#   {
#     name: "nil",
#     nickname: "The Quiet One"
#   }
# ]



# beatles.each do |member|
# 	case member[:nickname]
# 		when "The Smart One"
# 			member[:name]= "John Lennon"
# 		when "The Shy One"
# 			member[:name]= "Ringo Starr"
# 		when "The Cute One"
# 			member[:name]= "Paul McCartney"
# 		when "The Quiet One"
# 			member[:name]= "George Harrison"
# 	end
# end

# beatles.each do |member|
#   puts "Hi, I'm #{member[:name]}.  I'm #{member[:nickname]}!"
# end


puts "ben wuz here"