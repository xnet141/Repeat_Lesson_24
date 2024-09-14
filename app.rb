#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = 'something wrong!'
	erb :about 
end

get '/contacts' do
	erb :contacts 
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]
	
	hh = {
		'Имя пользователя' => @username, 
		:phone => @phone, 
		:datetime => @datetime, 
		:barber => @barber, 
		:color => @color
	}
	
	err = []
	
	hh.keys.each do |key|
		if  hh[key] == '' || hh[key] == '#7bd148'
			err << key
		end
	end
	
	

	if err.length == 0
		erb "User: #{@username}, Phone: #{@phone}, barber: #{@barber}, Date, time: #{@datetime}, Color: #{@color} \n"
	else
		@error = "Введите:  #{err.join(', ')}"
		erb :visit
	end
	#f = File.open "public/users.txt", "a"
	#f.write "User: #{@username}, Phone: #{@phone}, barber: #{@barber}, Date, time: #{@datetime} \n"
	#f.close

	#erb "User: #{@username}, Phone: #{@phone}, barber: #{@barber}, Date, time: #{@datetime}, Color: #{@color} \n"
	

end


post '/contacts' do
	@email = params[:email]
	@text = params[:text]
	
	f = File.open "public/contacts.txt", "a"
	f.write "Email: #{@email}, Text: #{@text},\n"
	f.close


	erb :contacts
end