class ApplicationController < ActionController::API
  def authenticate?(key, password)
    @user = User.find_by_key(Base64.decode64(key))
    if @user.password == Base64.decode64(password)
      return true
    else
      return false
    end
  end
end
