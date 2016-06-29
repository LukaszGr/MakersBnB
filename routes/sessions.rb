class App < Sinatra::Base

get '/session/new' do
  erb :login
end

post '/session/new' do
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:user_id] = @user.id
    redirect('/')
  else
    flash.now[:errors] = ['This email/password combination does not exist']
    erb :login
  end
end

post '/session/end' do
  session[:user_id] = nil
  redirect '/'
end

end
