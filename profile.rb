require "sinatra"
require "uri"

def page_content(title)
  File.read("profiles/#{title}.txt")
end

def save_content(title, content)
  File.open("profiles/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

def delete_content(title)
  File.delete("profiles/#{title}.txt")
end

get '/new' do
	erb :new
end

post '/create' do
	save_content(params[:title], params[:content])
	redirect URI.escape("/#{params[:title]}")
end

get '/:title' do
	erb :show
end
