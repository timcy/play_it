module VerifyAuthToken

  def check_auth_token(auth_token,user_id)
    @player = Player.find(user_id)
    raise  if @player.user.authtoken != auth_token
      rescue Exception =>e
        render json:{:status => false,:status_code=> 4001, :message => "Auth token not verified"}
  end
end