# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
#find players on the fly
def find_player(player)
basketball_game_hash = game_hash()
  
  # a variable to store an individual player's data after using enumerable methods
  
  player_hash = nil
  
  #I used each first because I want to call find later to pull out the hash of a player_hash
  #If I use find on the top level hash, it will return a top level hash
  
  basketball_game_hash.find do |team_type,team_hash|
    #p team_type,team_hash
    player_hash = team_hash[:players].find do|current_player|
      current_player[:player_name] == player
      end
    end
    player_hash
  end
  
  
def num_points_scored(player)
  #bring in our helper method to give us access to our game data
  player_hash = find_player(player)
  player_hash[:points]
end

def shoe_size(player)
  player_hash = find_player(player)
  player_hash[:shoe]
end
  
  def team_colors(team_name)
  basketball_game_hash = game_hash
  
  hash_of_team_we_want = basketball_game_hash.find do |team,team_hash| team_hash[:team_name] == team_name
  end
  hash_of_team_we_want[1][:colors]

end

#pp team_colors("Brooklyn Nets")
def player_numbers(team_name)
  #first let's dig into the data and pull out a sub hash for our team_name argument
  basketball_game_hash = game_hash
  sub_hash = basketball_game_hash.find do |team,team_hash|
    team_hash[:team_name] == team_name 
  end 
  sub_hash[1][:players].map{|player| player[:number]}
end

def team_names
  basketball_game_hash = game_hash
  basketball_game_hash.map do |team,team_hash|
    team_hash[:team_name]
  end
end

def player_stats(player)
  player_hash = find_player(player)
  player_hash
end

def big_shoe_rebounds
  basketball_game_hash = game_hash
  players = basketball_game_hash.map do|team,team_hash|
    team_hash[:players].select{|player|player[:player_name]}
  end

 big_shoe = players.flatten!.max_by do |player|
  #puts player[:player_name]
  player[:shoe]
  end
  big_shoe[:rebounds]
end

  