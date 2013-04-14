module Supplismo
  class Authentication
    def initialize(password, session)
      @password = password
      @session = session
    end

    def authenticate(password)
      @session[:admin] = valid_password?(password)
    end

    def valid_password?(password)
      @password == password
    end

    def admin?
      @session[:admin]
    end

    def destroy
      @session[:admin] = false
      !admin?
    end
  end
end
