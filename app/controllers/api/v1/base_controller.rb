class Api::V1::BaseController < ActionController::Base
  respond_to :json
  # before_filter :check_token, :only=>[:create,:update,:destroy]
  before_filter :authenticate_user, :only => [:create,:update,:destroy]
  before_filter :api_request,:only => [:create,:update,:destroy]
  before_filter :admin_user, :only => [:create,:update,:destroy]
  
  private
  def authenticate_user
     @current_user = User.find_by_access_token(params[:token])
  end

  def api_user
    if doorkeeper_token
        @current_user = User.find(doorkeeper_token.resource_owner_id)
    end
  end
  
  def current_user
  	@current_user
  end

  def admin_user
  	# render json:{:error=>"admin required"} if !current_user.admin	
  end

  def check_token
  	render json:{:error=>"Token required"} if params[:token].blank?
  end
  
  def api_request
  	# @req = ApiRequest.create(:request => request.fullpath.to_s,:param => params.to_s,:in_datetime=> Time.now,:user_id => current_user.id)
  end

  def current_req
  	@req
  end

end