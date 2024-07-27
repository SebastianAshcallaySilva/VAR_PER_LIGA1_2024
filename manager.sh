#!/bin/bash
# This program will be used for queries and adding information to my database
source config.sh

# BUILDER
BUILDER() {
    # Create a database named <liga1_2024_var>
    CREATE_DB_RESULT=$($PSQL_MAIN "CREATE DATABASE liga1_2024_var")
    echo ">> $CREATE_DB_RESULT"

    # CREATE TABLES
    CREATE_DECISIONS_TABLE=$($PSQL "CREATE TABLE decisions(decision_id SERIAL PRIMARY KEY UNIQUE,
                                                            type_id INT NOT NULL,
                                                            game_id INT NOT NULL,
                                                            home_id INT NOT NULL,
                                                            away_id INT NOT NULL,
                                                            home_goal_diff INT,
                                                            away_goal_diff INT,
                                                            home_red_diff INT,
                                                            away_red_diff INT,
                                                            round INT)")
    if [[ $CREATE_DECISIONS_TABLE = "CREATE TABLE" ]]
    then
        echo ">> TABLE [decisions] CREATED"
    fi

    CREATE_TYPES_TABLE=$($PSQL "CREATE TABLE types(type_id SERIAL PRIMARY KEY UNIQUE,
                                                    name VARCHAR(50) NOT NULL)") 
    if [[ $CREATE_TYPES_TABLE = "CREATE TABLE" ]]
    then
        echo ">> TABLE [types] CREATED"
    fi

    CREATE_GAMES_TABLE=$($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY UNIQUE,
                                                    home_id INT NOT NULL,
                                                    away_id INT NOT NULL,
                                                    home_goals INT NOT NULL,
                                                    away_goals INT NOT NULL,
                                                    round INT,
                                                    home_red INT,
                                                    away_red INT)")
    if [[ $CREATE_GAMES_TABLE = "CREATE TABLE" ]]
    then
        echo ">> TABLE [games] CREATED"
    fi

    CREATE_TEAMS_TABLE=$($PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY UNIQUE,
                                                    name VARCHAR(50) NOT NULL,
                                                    points INT NOT NULL,
                                                    goals_for INT,
                                                    goals_against INT,
                                                    wins INT,
                                                    losses INT,
                                                    draws INT)")
    if [[ $CREATE_TEAMS_TABLE = "CREATE TABLE" ]]
    then
        echo ">> TABLE [teams] CREATED"
    fi

    # CREATE FOREIGN KEYS
    CREATE_FOREIGN_KEYS=$($PSQL "ALTER TABLE games ADD FOREIGN KEY(home_id) REFERENCES teams(team_id);
                                ALTER TABLE games ADD FOREIGN KEY(away_id) REFERENCES teams(team_id);
                                ALTER TABLE decisions ADD FOREIGN KEY(type_id) REFERENCES types(type_id);
                                ALTER TABLE decisions ADD FOREIGN KEY(game_id) REFERENCES games(game_id);
                                ALTER TABLE decisions ADD FOREIGN KEY(home_id) REFERENCES teams(team_id);
                                ALTER TABLE decisions ADD FOREIGN KEY(away_id) REFERENCES teams(team_id)")
    echo ">> FOREIGN KEYS CREATED"

    # By the end of this function, our main database structure is complete
}

# INSERT TEAMS
INSERT_TEAMS() {
    FILE="liga1_2024_teams.csv"

    # set starting position
    COUNTER=$($PSQL "SELECT COUNT(*) FROM teams")
    COUNTER=$(( COUNTER + 2 ))
    
    # loop: insert teams
    LINE_NUM=1    
    cat $FILE | while IFS="," read TEAM PTS WINS DRAWS LOSSES GF GA
    do
        if [[ $LINE_NUM -ge $COUNTER ]]
        then
            TEAMS_COLUMNS="name,points,goals_for,goals_against,wins,losses,draws"
            INSERT_TEAM=$($PSQL "INSERT INTO teams($TEAMS_COLUMNS) VALUES('$TEAM',$PTS,$GF,$GA,$WINS,$LOSSES,$DRAWS)")
        fi

        let LINE_NUM++
    done

    TEAMS_INSERTED=$($PSQL "SELECT COUNT(*) FROM teams")
    echo ">> Inserted $TEAMS_INSERTED teams"
    
}

# INSERT GAMES
INSERT_GAMES() {
    FILE="liga1_2024_games.csv"

    # set starting position
    COUNTER=$($PSQL "SELECT COUNT(*) FROM games")
    COUNTER=$(( COUNTER + 2 ))

    # loop: insert games
    LINE_NUM=1
    cat $FILE | while IFS="," read ROUND HTEAM ATEAM HGOALS AGOALS HRED ARED
    do
        if [[ $LINE_NUM -ge $COUNTER ]]
        then
            # find home team
            HTEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$HTEAM'")

            # find away team
            ATEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$ATEAM'")

            # Insert game
            GAMES_COLUMNS="home_id,away_id,home_goals,away_goals,round,home_red,away_red"
            INSERT_GAME=$($PSQL "INSERT INTO games($GAMES_COLUMNS) VALUES($HTEAM_ID,$ATEAM_ID,$HGOALS,$AGOALS,$ROUND,$HRED,$ARED)")
        fi

        let LINE_NUM++
    done  

    GAMES_INSERTED=$($PSQL "SELECT COUNT(*) FROM games")
    echo ">> Inserted $GAMES_INSERTED games"
}

# INSERT DECISIONS
INSERT_DECISIONS() {
    FILE="liga1_2024_decisions.csv"

    # set starting position
    COUNTER=$($PSQL "SELECT COUNT(*) FROM decisions")
    COUNTER=$(( COUNTER + 2 ))

    # loop: insert games
    LINE_NUM=1
    cat $FILE | while IFS="," read TYPE ROUND HTEAM ATEAM HGOAL AGOAL HRED ARED
    do
        if [[ $LINE_NUM -ge $COUNTER ]]
        then
            # find type
            TID=$($PSQL "SELECT type_id FROM types WHERE name='$TYPE'")
            # if type not found, add type
            if [[ -z $TID ]]
            then
                ADD_TYPE=$($PSQL "INSERT INTO types(name) VALUES('$TYPE')")
                TID=$($PSQL "SELECT type_id FROM types WHERE name='$TYPE'")
            fi

            # find home team id
            HTEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$HTEAM'")

            # find away team id
            ATEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$ATEAM'")

            # find game id
            GAME_ID=$($PSQL "SELECT game_id FROM games WHERE home_id=$HTEAM_ID AND away_id=$ATEAM_ID")

            # insert decision
            DECISIONS_COLUMNS="type_id,game_id,home_id,away_id,home_goal_diff,away_goal_diff,home_red_diff,away_red_diff,round"
            INSERT_DECISION=$($PSQL "INSERT INTO decisions($DECISIONS_COLUMNS) VALUES($TID,$GAME_ID,$HTEAM_ID,$ATEAM_ID,$HGOAL,$AGOAL,$HRED,$ARED,$ROUND)")
        fi

        let LINE_NUM++
    done

    DECISIONS_INSERTED=$($PSQL "SELECT COUNT(*) FROM decisions")
    TYPES_INSERTED=$($PSQL "SELECT COUNT(*) FROM types")
    echo ">> Inserted $DECISIONS_INSERTED decisions"
    echo ">> Inserted $TYPES_INSERTED types"
}



# MAIN
MAIN() {

    if [[ $1 = "--drop" ]]
    then
        DROP_DATABASE=$($PSQL_MAIN "DROP DATABASE liga1_2024_var")
        echo -e "\nDROP DATABASE"
    elif [[ $1 = "--fast-build" ]]
    then
        BUILDER
        INSERT_TEAMS
        INSERT_GAMES
        INSERT_DECISIONS
    elif [[ $1 = "--info" ]]
    then
        echo -e "\n~ INFO ~\n"
        DB_NAME="liga1_2024_var"
        NAME_OF_DATABASE=$($PSQL_MAIN "SELECT datname FROM pg_database WHERE datname='$DB_NAME'")

        # check existence database
        if [[ -z $NAME_OF_DATABASE ]]
        then
            echo "DB[$DB_NAME]: does not exist"
        else
            echo "DB[$DB_NAME]: exists"
            NUM_TEAMS=$($PSQL "SELECT COUNT(*) FROM teams")
            echo -e "Number of teams:\t$(echo $NUM_TEAMS | sed -E 's/^ *| *$//g')"
            NUM_GAMES=$($PSQL "SELECT COUNT(*) FROM games")
            echo -e "Number of games:\t$(echo $NUM_GAMES | sed -E 's/^ *| *$//g')"
            NUM_DECISIONS=$($PSQL "SELECT COUNT(*) FROM decisions")
            echo -e "Number of decisions:\t$(echo $NUM_DECISIONS | sed -E 's/^ *| *$//g')"
            NUM_TYPES=$($PSQL "SELECT COUNT(*) FROM types")
            echo -e "Number of types:\t$(echo $NUM_TYPES | sed -E 's/^ *| *$//g')"
            LATEST_ROUND=$($PSQL "SELECT MAX(round) FROM games")
            echo -e "Last round updated:\t$(echo $LATEST_ROUND | sed -E 's/^ *| *$//g')\n"
        fi
    elif [[ $1 ]]
    then
        echo -e "\n>> $1\n"
    else
        echo -e "\n~ VAR - LIGA 1 (PER) - 2024\n"
        echo -e "Menu: Choose one of the following options\n"
        echo -e "[1] UPDATE TEAMS"
        echo -e "[2] UPDATE GAMES"
        echo -e "[3] UPDATE DECISIONS"
        echo "----------------------------------"
        read OPTION_SELECTED

        case $OPTION_SELECTED in
            1) INSERT_TEAMS ;;
            2) INSERT_GAMES ;;
            3) INSERT_DECISIONS ;;
            *) MAIN_MENU "Invalid option selected. Please select a valid option"
        esac
    fi
}

# Execute MAIN with/out argument
if [[ -z $1 ]]
then
    MAIN
else
    MAIN $1
fi
