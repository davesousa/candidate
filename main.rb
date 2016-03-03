# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here


##Qualified Candidates
def qualified_candidates(candidate_list)
  candidate_list.select {|candidate| experienced?(candidate)}
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2 &&
  candidate[:github_points] >= 100 &&
  (candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")) &&
  candidate[:date_applied] > 15.days.ago.to_date &&
  candidate[:age] >= 15
end


## Find User with mathing ID
def find_id(id)
  @candidates.select {|candidate| candidate[:id] == id}
end


## Sort Candidates
def ordered_by_qualifications (candidate)
  candidate.sort_by {|k| [k[:years_of_experience], k[:github_points]]}.reverse
end

##pp find_id(5)

##pp qualified_candidates(@candidates)

##pp ordered_by_qualifications(@candidates)

def repl
  puts "find5 - To show candidate 5."
  puts "all - To show all candidates."
  puts "qualified - To show qualified candidates."
  puts "quit."

  while true do

    user = gets.chomp.downcase

    case user
    when /find5/
      pp find_id(5)
    when /all/
      pp @candidates
    when /qualified/
      pp qualified_candidates(@candidates)
    when /quit/
      break
    end
  end
end

repl
