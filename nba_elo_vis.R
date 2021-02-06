nba = read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/nba-elo/nbaallelo.csv")


summary(nba)
head(nba)
str(nba)

# Variables to use 
nba$game_result
nba$elo_i
nba$game_id

test = do.call(rbind,lapply(1:63157, function(x) nba$elo_i[nba$gameorder == x]))

test_2 = cbind(1:63157,test)



final_nba = as.data.frame(cbind(nba$gameorder,nba$game_id,nba$elo_i,nba$game_location,nba$game_result))

colnames(final_nba) = list("gameorder","game_id","elo_i","game_location","game_result")

home = as.data.frame(final_nba[which(final_nba$game_location == "H"),])
away = as.data.frame(final_nba[which(final_nba$game_location == "A"),])


test_3 = merge(home, away, by.x="game_id", by.y="game_id")


