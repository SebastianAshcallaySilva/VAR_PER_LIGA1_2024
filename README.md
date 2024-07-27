# VAR_PER_LIGA1_2024
VAR decision tracker for Peru's Liga 1 Tournament (2024).

## Intro
Takes inspiration from ESPN's seasonal tracker on
VAR decisions for the Premier League. This project
will be using a SQL database to store data related
to VAR decisions in Peru's Liga 1 Tournament.

## SQL Database
Tables will be structured as follows:
```bash
Legend:
(*) - primary key
>> - reference key

--- decisions
 |--- decision_id (*)
 |--- type_id >> types(type_id)
 |--- game_id >> games(game_id)
 |--- home-id >> teams(team_id)
 |--- away_id >> teams(team_id)
 |--- home_goal_diff
 |--- away_goal_diff
 |--- home_red_diff
 |--- away_red_diff
 |--- round


--- types
 |--- type_id (*)
 |--- name

--- games
 |--- game_id (*)
 |--- home_id >> teams(team_id)
 |--- away_id >> teams(team_id)
 |--- home_goals
 |--- away_goals
 |--- round
 |--- home_red
 |--- away_red

--- teams
 |--- team_id (*)
 |--- name
 |--- points
 |--- goals_for
 |--- goals_against
 |--- wins
 |--- losses
 |--- draws

```

## Script
Local script `manager.sh` will be used to access the database and query essential information.
The script accounts for different purposes:
* `--drop` - Drops database (used for testing purposes)
* `--fast-build` - Builds database structure and inserts information from CSV files.
* `--info` - Prints information about the current database
* `[arg]` - Prints out the argument passed (ex. comment) if it's not one of the options above
* `[no-arg]` - Prints out a menu screen to update team, game, or decision information.

## License
[MIT](https://choosealicense.com/licenses/mit/)
