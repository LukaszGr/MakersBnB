class App < Sinatra::Base

get '/user/new' do
  erb :signup
end

post '/user/new' do
  @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

  if @user.save
    session[:user_id] = @user.id
    User.send_welcome_email(@user)
    redirect('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :signup
  end
end

end
