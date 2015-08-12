# voter_simulation2.rb
class World
	attr_accessor :id, :name, :politics, :political_party, :stump_speech

	@@person_id = 0
	@@politician_id = 0

	@@persons = []
	@@politicians = []

	@@democratic_votes = []
	@@republican_votes = []

	@@stump_speech = []

	@@all_republicans = []
	@@all_democrats = []

	@@democratic_nominee = []
	@@republican_nominee = []

end

	class Person < World
		attr_accessor :sample_persons

		def initialize(name, politics)
			@id = @@person_id
			@name = name
			@politics = politics

			@@person_id += 1
			@@persons << self
		end

		def self.all
			@@persons
		end

		def self.sample_persons
			karl_engles = Person.new("Karl Engles", "Socialist")
			friedrich_marx = Person.new("Friedrich Marx", "Socialist")
			larry_b_johnson= Person.new("Larry B. Johnson", "Liberal")
			franklin_d_carter = Person.new("Franklin D. Carter", "Liberal")
			john_doe = Person.new("John Doe", "Neutral")
			james_e_shrub = Person.new("James E. Shrub", "Conservative")
			ronald_bush = Person.new("Ronald Bush", "Conservative")
			tedd_rand = Person.new("Ted Rand", "Tea Party")
			marco_cruz = Person.new("Marco Cruz", "Tea Party")	
		end

		def self.democratic_votes
			@@democratic_votes
		end

		def self.republican_votes
			@@republican_votes 
		end

	end

	class Politician < World
		attr_accessor :campaign
		
		def initialize(name, political_party)
			@id = @@politician_id
			@name = name
			@political_party = political_party
			@@politician_id += 1
			@@politicians << self
		end

		def self.all
			@@politicians
		end

		def visit_each_voter
			two_nominees = @@democratic_nominee + @@republican_nominee
			two_nominees.each do |politicians|
				puts "Hello I'm #{politicians.name}."			
					@@politicians.each do |other_politicians|
						unless politicians.name == other_politicians.name					
						puts "#{other_politicians.name} says, I'm voting for myself."
					end

					@@persons.each do |person|
						
					end
				end
			end
		end

		def stump_speech
		end

		def campaign
			visit_each_voter()
		end

		def self.primary
			Politician.all.each do |politicians|
				if politicians.political_party.downcase == "democrat"
					@@all_democrats.push(politicians)
				else 
					@@all_republicans.push(politicians)
				end
			end

			puts @@all_democrats
			puts @@all_republicans

			if @@all_democrats.count > 1
				puts "There are #{@@all_democrats.count} Democrats."
				puts "Democratic primary."
				@@democratic_nominee = @@all_democrats.sample(1)
				@@democratic_nominee.each do |nominee|
					puts "And the Democratic nominee is #{nominee.name}!"
				end
			else
				@@democratic_nominee.push(@@all_democrats[0])
			end

			p @@democratic_nominee

			if @@all_republicans.count > 1
				puts "There are #{@@all_republicans.count} Republicans."
				puts "Republican primary."
				@@republican_nominee = @@all_republicans.sample(1)
				@@republican_nominee.each do |nominee|
					puts "And the Republican nominee is #{nominee.name}!"
				end
			else
				@@republican_nominee.push(@@all_republicans[0])
			end

			p @@republican_nominee
		end

		def self.democratic_nominee
			@@democratic_nominee
		end

		def self.republican_nominee
			@@republican_nominee
		end

		def self.sample_politicians
			phant = Politician.new("L. E. Phant", "Republican")
			key = Politician.new("Donald 'Don' Key", "Democrat")	
		end
	end




def start
		process = 0
		until process == 1
		puts "What would you like to do? Create, List, Update, or Vote."
		answer = gets.chomp
		  case answer.downcase
			when 'create'
				create()
			when 'list'
				list()
			when 'update'
				update()
			when 'vote'
				vote()
				process += 1
			else
				puts "You didn't enter Create, List, Update or Vote."
			end
		end
	end

	def create
		puts "What would you like to create? Politician or Person."
		create_answer = gets.chomp
		if create_answer.downcase == 'politician'
			puts "Name?"
			name = gets.chomp.capitalize
			puts "Party? Democrat or Republican."
			political_party = gets.chomp.capitalize
			
			charlie = Politician.new(name, political_party)	
		elsif create_answer.downcase == 'person'
			puts "Name?"
			name = gets.chomp.capitalize
			puts "Politics? Liberal, Conservative, Tea Party, Socialist or Neutral"
			politics = gets.chomp.capitalize
			yoda = Person.new(name, politics)
		else
			puts "You didn't write 'Politician' or 'Person.'"
		end
	end

	def list 
		Person.all.each do |person|
			puts "Voter, #{person.name}, #{person.politics}"
		end

		Politician.all.each do |pol|
			puts "Politician, #{politicians.name}, #{politicians.political_party}"
		end
		
	end
	
	def update
		puts "Please enter the name of the person your would like to update?"
		old_name = gets.chomp.capitalize
		puts "What would you like to update? Name, Party, or Politics"
		update_this = gets.chomp.capitalize
		if update_this ==  "Name"
			puts "What is the new name?"
			new_name = gets.chomp.capitalize

			Person.all.each do |person|
				if old_name == person.name
					person.name = new_name
				end
			end

			Politician.all.each do |politicians|
				if old_name == politicians.name
					politicians.name = new_name
				end
			end
		elsif update_this == "Politics"
			puts "What are your new politics? Socialist, Liberal, Neutral, Conservative, Tea Party"
			new_politics = gets.chomp
			Person.all.each do |person|
				if old_name == person.name
					person.politics = new_politics
				end
			end

		elsif update_this == "Party"
			puts "What is your new party?"
			new_party = gets.chomp
			Politician.all.each do |pol|
				if old_name == politicians.name
					politicians.political_party = new_party
				end
			end 	 
		else
			puts "You didn't enter Name, Political Party, or Politics."
		end
	end

	def run_campaign
		Politician.all.each do |politicians|
			politicians.campaign()
		end
	end

	def probability(num)
		(1 + rand(100)) > num
	end

def changed_mind(x, name, politics)
		if x == true
			puts "I'm #{name}, I am a #{politics}. I didn't change my mind."
		else
			puts "I'm #{name}, I am a #{politics}. I changed my mind."
		end
	end

def vote
		Politician.primary()
		run_campaign()
		
		(Person.all).each do |people|
			
			case
				when people.politics.downcase == "tea party"
					if probability(10)
						changed_mind(false, people.name, people.politics)
						Person.republican_votes.push(people)
					else
						changed_mind(true, people.name, people.politics)
						Person.democratic_votes.push(people)
					end

				when people.politics.downcase == "conservative"
					if probability(25)
						changed_mind(false, people.name, people.politics)
						Person.republican_votes.push(people)
					else
						changed_mind(true, people.name, people.politics)
						Person.democratic_votes.push(people)
					end

				when people.politics.downcase == "neutral"
					if probability(50)
						puts "I'm #{people.name}. I'm #{people.politics} so I'm not sure whether I changed my mind."
						Person.republican_votes.push(people)
					else
						puts "I'm #{people.name}. I'm #{people.politics} so I'm not sure whether I changed my mind."
						Person.democratic_votes.push(people)
					end 

				when people.politics.downcase == "liberal"
					if probability(25)
						changed_mind(false, people.name, people.politics)
						Person.democratic_votes.push(people)
					else
						changed_mind(true, people.name, people.politics)
						Person.republican_votes.push(people)
					end

				when people.politics.downcase == "socialist"
					if probability(10)
						changed_mind(false, people.name, people.politics)
						Person.democratic_votes.push(people)
					else
						changed_mind(true, people.name, people.politics)
						Person.republican_votes.push(people)
					end
				else
					puts "For some reason. We're not finding your politics...please update your politics before voting."
				end	
			end
		tally()
    end
	
	def tally
		report_results()

		if Person.republican_votes.count == Person.democratic_votes.count
			vote
		elsif Person.republican_votes.count > Person.democratic_votes.count
			Politician.republican_nominee.each do |politician|
					puts "#{politician.name} wins the election."				
			end
		else
			 Politician.democratic_nominee.each do |politician|
					puts "#{politician.name} wins the election."
			end
		end
		puts
	end

def report_results
		puts "The results are in:"
		puts "#{Person.republican_votes.count} people voted Republican." 
		puts "#{Person.democratic_votes.count} people voted Democrat." 
	end
	
Person.sample_persons()
Person.republican_votes.push(Politician.new("L. E. Phant", "Republican"))
Person.democratic_votes.push(Politician.new("Donald 'Don' Key", "Democrat"))

start()


