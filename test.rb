# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

def qualified_candidates(candidate_list)
  candidate_list.select {|candidate| qualified?(candidate)}
end

def qualified?(candidate)
  candidate[:github_points] >= 300
end





pp qualified_candidates(@candidates)
