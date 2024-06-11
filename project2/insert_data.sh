#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
echo $($PSQL "TRUNCATE games, teams")
# Do not change code above this line. Use the PSQL variable above to query your database.

# fill in the teams table
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $winner != "winner" ]]
  then
    # get winner team_id 
    team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    # if id does not exist, add the team to the tabe
    if [[ -z $team_id ]]
    then
        INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES ('$winner')")
        #if [[ $INSERT_TEAM_ID == "INSERT 0 1" ]]
        #then
        #  echo Inserted into majors, $winner
        #fi
    fi
    # get opponent id
    opponent_id=$($PSQL " SELECT team_id FROM teams WHERE name='$opponent'")
    # if it does not exist, add the team to the table
    if [[ -z $opponent_id ]]
    then
        INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES ('$opponent')")
      
       if [[ $INSERT_TEAM_ID == "INSERT 0 1" ]]
       then
          echo Inserted into teams, $opponent
       fi
      
    fi
  # fill in games table
  # get winner team id
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
  # get opponent team id 
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")

  # insert game info in table 
    game_insert=$($PSQL " INSERT INTO games(year,round,winner_id, opponent_id, winner_goals,opponent_goals) 
                  VALUES ($year, '$round',$winner_id, $opponent_id, $winner_goals , $opponent_goals)")
    
    if [[ game_insert == "INSERT 0 1" ]]
    then
      echo Inserted into games, $year  $winner_goals $opponent_goals

    fi
    
  fi

done


# fill in the games table




