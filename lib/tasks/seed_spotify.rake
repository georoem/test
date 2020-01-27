require 'httparty'
require 'yaml'

AUTORIZATION = "Basic MGNmYzA0NjQ0OTJhNGU5YTg5NTNmMTEyNzE4ZjI2MGY6MmM5ODRkMjk0ZmQ2NDAwZmFhNzVlMzQ5OTU3OGE0NmU="

namespace :seed_spotify do
    desc 'Load seed data from spotify into the database of the current environment'
    task :load => :environment do
        
        token = getToken(AUTORIZATION)
        Dir.glob(Rails.root.to_s + '/db/seed_data/*.yml').each do |file|
            config_options = YAML.load_file(file)
            config_options.each do |key, value|
                value.each do |artist|
                    loadData(artist, token)
                end
            end
        end
  end
end

def getToken(autorization)
    response = HTTParty.post("https://accounts.spotify.com/api/token",
        body: {
            "grant_type" => "client_credentials"
        },
        headers: { 
            "Content-Type" => "application/x-www-form-urlencoded",
            "Authorization" => autorization 
    })
    return response['access_token']
end

def loadData(artistName, token)
    response = HTTParty.get("https://api.spotify.com/v1/search?q=" + artistName.to_s + "&type=artist",
    headers: {
        "Authorization" => "Bearer " + token
    })

    artist = response['artists']['items'][0]

    loadArtist(artist, token)
    
end

def loadArtist(artist, token)
    genres = artist['genres']
    images = artist['images']
    spotify_id =artist['id']
    spotify_url =artist['href']
    name = artist['name']
    popularity = artist['popularity']

    artistSaved = Artist.create({ 
        :name => name, 
        :popularity => popularity.to_i, 
        :spotify_url => spotify_url, 
        :spotify_id => spotify_id})

    loadGenres(genres, artistSaved.id)

    loadArtistImages(images, artistSaved.id)

    loadAlbums(artistSaved, token)
end

def loadGenres(genres, artist_id)
    genres.each do |genre|
        Genre.create({
            :name => genre,
            :artist_id => artist_id
        })
    end
end

def loadArtistImages(images, artist_id)
    images.each do |image|
        height = image['height']
        url = image['url']
        width = image['width']
        Image.create({
            :height => height,
            :url => url,
            :width => width,
            :artist_id => artist_id
        })
    end
end

def loadAlbums(artist, token)
    response = HTTParty.get("https://api.spotify.com/v1/artists/"+artist.spotify_id+"/albums",
    headers: {
        "Authorization" => "Bearer " + token
    })

    albums = response['items']

    albums.each do |album|
        
        name = album['name']
        spotify_url = album['href']
        total_tracks =album['total_tracks'].to_i
        spotify_id = album['id']
        images = album['images']

        albumSaved = Album.create({
            :name => name,
            :spotify_url => spotify_url,
            :total_tracks => total_tracks,
            :spotify_id => spotify_id,
            :artist_id => artist.id
        })

        loadAlbumImages(images, albumSaved.id)

        loadSongs(albumSaved, token)
    end
end

def loadAlbumImages(images, album_id)
    images.each do |image|
        height = image['height']
        url = image['url']
        width = image['width']
        Image.create({
            :height => height,
            :url => url,
            :width => width,
            :album_id => album_id
        })
    end
end

def loadSongs(album, token)
    response = HTTParty.get("https://api.spotify.com/v1/albums/"+album.spotify_id+"/tracks",
    headers: {
        "Authorization" => "Bearer " + token
    })

    songs = response['items']

    songs.each do |song|

        name = song['name']
        spotify_url = song['href']
        preview_url = song['preview_url']
        duration_ms = song['duration_ms'].to_i
        explicit = song['explicit']
        spotify_id = song['id']

        Song.create({
            :name => name,
            :spotify_url => spotify_url,
            :preview_url => preview_url,
            :duration_ms => duration_ms.to_i,
            :explicit => explicit,
            :spotify_id => spotify_id,
            :album_id => album.id
        })
        
    end
end
