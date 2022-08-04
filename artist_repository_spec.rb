require 'artist_repository'

RSpec.describe ArtistRepository do
    def reset_artists_table
        seed_sql = File.read('spec/seed_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
      reset_artists_table
    end

  it 'returns the list of artists' do
  repo = ArtistRepository.new

  artists = repo.all 

  expect(albums.length).to eq (2) # => 2
  expect(albums.first.id).to eq ('1') # => '1'
  expect(albums.first.name).to eq ('Pixies') # => 'Pixies'
  end
  it 'returns the Pixies single artist' do

    repo = ArtistRepository.new
 
    artists= repo.find(1)
    expect(artists.name).to eq 'Pixies' # =>  'Pixies'
    expect(artists.genre).to eq 'Rock' # =>  'Rock'
   end
 
   it 'returns the Abba single artist' do
 
    repo = ArtistRepository.new
 
    artists= repo.find(2)
    expect(artists.name).to eq 'Abba' # =>  'Abba'
     expect(artists.genre).to eq 'Pop' # =>  'Pop'
 
   end
end
  
  


