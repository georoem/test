# Rubytify

## Instructions

- For the rubytify instructions check this gist: https://gist.github.com/AyendaRooms/235cd0955799dfc1c9ec5fa28d00f2ae 
- To upload the code create your own fork of this repo and start a pull request to this repo once you're done with your changes.

# Rubitify Description

The rubitify project is a technical test to apply to Ayenda development staff and consist in develop an API that exposes basic artists information from Spotify like albums, genres and songs. 

## Pre requisites 
* Ruby 2.6.5
* Rails 5.2.3

### Project
The project Rubytify is composed by following components:
```
API: Are a serie of end point that exposed the artist information like album and genres from the Spotify API.
IMPORTER: Is a rake task that load all the basic artist information from spotify based in an artist list in a yml file.  
```

## Configuration 
To run the project in local environment perform the following tasks:
 
```
bundle install
rails s
```

Check the url: http://localhost:3000/api/v1/artists

To run the spect test perform the following task:

```
bundle exe rspec
```

To run the rake task that load artist information from spotify perform the following commnand:

```
rake seed_spotify:load
```

Note: To run rake task is mandatory to put the spotify credentials token in seed_spotify.rake

```
AUTORIZATION = "Put your credentials token here!"
```