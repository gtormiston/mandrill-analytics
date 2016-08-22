# Mandrill Analytics

A program that provides analytics on historical information stored via Mandrill web hooks.

### Approach

- Framework: Rails - quick setup, coding by convention, same system that I believe the company use in production
- Data store: PostgreSQL table
- Testing: RSpec

I opted for the simplest, quickest setup I could - minimal gems / libraries and as much convention as possible to avoid getting bogged down. With Rails I will be able to add in extra features such as user authentication easily later.

**Table design**:

I decided to use a single table structure to store all webhook entries in the same order as the JSON entries coming from the sample data payloads, essentially:

| id | address | emailtype | event | timestamp |
| ---- | ---- | ---- | ---- | ---- | ---- |
| INT | STRING | STRING | STRING | INT |

I generated the model for *Webhook* (I think probably a pretty poor choice of names in hindsight), which created the table for me (along with 'created_at', and 'updated_at' tables which I didn't particularly want but I suppose could end up useful later on!) I then added a migration for each of the columns in the table to match the design above.

I utilised a couple of simple, re-useable methods to try and keep the code as clean and small as possible - in effect two methods doing the calculating or logic:

`email_count` is a very short method that uses the Rails 'group' feature to create a useable hash of all the records which I can then easily re-use by specifying the field I want to run the 'count' method on.

`calculate_rate` could do with some refactoring, but is another re-useable method, this time taking a couple of arguments that allow me to state which rate I wish to calculate, and for which email type.

**Challenges**:

I had a few challenges: the first, major one was how to access and save the JSON data I was passing to the POST route. I could see the data was there and that it was increasing as more data was sent through, but I couldn't access the raw JSON until I found `.parse_data(request.raw_post)`. However, I feel like this is clunky and I'm missing some Rails 'magic' that would make this much more straight forward.

Due to the amount of time I spent solving the previous issue (and the fact that I moved house this weekend :smile:), I did end up spiking quite a lot of my code and would like to revisit by writing the tests first for a more TDD based approach.

Given extra time to work on this, I'd love to add in some front-end magic -  adding some decent styling to the statistics page, setting up a continuous refresh with AJAX so the stats update in realtime.


### How to use it

This program requires Rails 5, Ruby (2.3.1), PostgreSQL

1. Download or clone this repo
1. `bundle install` to ensure you have the required gems
1. `rake db:create` to create the database
1. `rake db:migrate` to setup the database
1. `rails s` starts the server
1. Set the endpoint (Mandrill API) to send JSON POST data to http://localhost:3000/webhooks.json
1. Open http://localhost:3000 to see the statistics, and refresh for updated stats over time



### User stories

```text
As a company
So that we can perform research on our campaigns
We want to receive and store information via Mandrill web hooks
```
```text
As a company
So that we can identify past trends and improve future performance
We would like to display statistics on email campaigns
```

### Requirements

The platform should display the following statistics:

- total number of emails sent
- total number of emails opened
- total number of clicks
- open rate per email type
- click rate per email type
