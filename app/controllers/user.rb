enable :sessions

post '/signup' do
  password_salt = BCrypt::Engine.generate_salt
  password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)

  @new_user = Player.create(email: params[:email], username: params[:username], password_hash: password_hash, password_salt: password_salt)
  session[:id] = @new_user.id
  haml :_signup_errors, :layout => false
end


post '/signin' do

  @new_user = Player.authenticate(params[:email], params[:password])
  return 'nope' if @new_user == nil
  session[:id] = @new_user.id

  puts "*" * 50
  p "it worked!"
  # redirect '/main'
end

post '/logout' do
  session.clear
  redirect '/'
end
