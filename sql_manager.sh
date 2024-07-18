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
    CREATE_DB_RESULT=$($PSQL "CREATE DATABASE liga1_2024_var")
    echo ">> $CREATE_DB_RESULT"
}

# MAIN
MAIN() {
    if [[ $1 = "builder" ]]
    then
        BUILDER
    fi
}
