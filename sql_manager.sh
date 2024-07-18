#!/bin/bash
# This program will be used for queries and adding information to my database
# Set environment variable:
# >> PSQL_PATH="/Applications/Postgres.app/Contents/Versions/latest/bin"
# >> PATH="$PATH:$PSQL_PATH"

# Using Postgres.app
PSQL="psql -X --username=sebastianashcallay --dbname=liga1_2024_var --tuples-only -c"
PSQL_MAIN="psql -X --username=sebastianashcallay --dbname=postgres --tuples-only -c"

# BUILDER
BUILDER() {
    # Create a database named <liga1_2024_var>
    # CREATE_DB_RESULT=$($PSQL_MAIN "CREATE DATABASE liga1_2024_var")
    # echo ">> $CREATE_DB_RESULT"

    # CREATE TABLES
    CREATE_DECISIONS_TABLE=$($PSQL "CREATE TABLE decisions(decision_id SERIAL PRIMARY KEY UNIQUE,
                                                            type_id INT NOT NULL,
                                                            game_id INT NOT NULL,
                                                            home_id INT NOT NULL,
                                                            away_id INT NOT NULL,
                                                            home_goal_diff INT NOT NULL,
                                                            away_goal_diff INT NOT NULL)")
    if [[ $CREATE_DECISIONS_TABLE = "CREATE TABLE"]]
    then
        echo ">> TABLE [decisions] CREATED"
    fi

    CREATE_TYPES_TABLE=$($PSQL "CREATE TABLE types(type_id SERIAL PRIMARY KEY UNIQUE,
                                                    name VARCHAR(50) NOT NULL)") 
    if [[ $CREATE_TYPES_TABLE = "CREATE TABLE"]]
    then
        echo ">> TABLE [types] CREATED"
    fi

    CREATE_GAMES_TABLE=$($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY UNIQUE,
                                                    home_id INT NOT NULL,
                                                    away_id INT NOT NULL,
                                                    home_goals INT NOT NULL,
                                                    away_goals INT NOT NULL)")
    if [[ $CREATE_GAMES_TABLE = "CREATE TABLE"]]
    then
        echo ">> TABLE [games] CREATED"
    fi

    CREATE_TEAMS_TABLE=$($PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY UNIQUE,
                                                    name VARCHAR(50) NOT NULL,
                                                    points INT NOT NULL,
                                                    goals_for INT,
                                                    goals_against INT,
                                                    wins INT
                                                    losses INT
                                                    draws INT)")
    if [[ $CREATE_TEAMS_TABLE = "CREATE TABLE"]]
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



# MAIN
MAIN() {
    BUILDER
}

MAIN
