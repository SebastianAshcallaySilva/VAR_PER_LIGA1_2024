# VAR_PER_LIGA1_2024
VAR decision tracker for Peru's Liga 1 Tournament (2024).

## Intro
Takes inspiration from ESPN's seasonal tracker on
VAR decisions for the Premier League. This project
will be using a SQL database to store data related
to VAR decisions in Peru's Liga 1 Tournament.

## Database
Tables will be structured as follows:
```bash
--- decisions
 |--- type_id
 |--- game_id
 |--- home_team
 |--- away_team
 |--- home_goal_diff
 |--- away_goal_diff


--- types
 |--- type_id
 |--- name

--- games
 |--- game_id
 |--- home_team
 |--- away_team
 |--- home_goals
 |--- away_goals

--- teams
 |--- team_id
 |--- name
 |--- points
 |--- goals_for
 |--- goals_against
 |--- wins
 |--- losses
 |--- draws

```

## License
[MIT](https://choosealicense.com/licenses/mit/)
