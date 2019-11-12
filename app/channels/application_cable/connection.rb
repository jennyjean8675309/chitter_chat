module ApplicationCable
  class Connection < ActionCable::Connection::Base
  #   identified_by :current_user

  #   def connect
  #     self.current_user = find_verified_user
  #   end

  #   protected

  #   def find_verified_user
  #     # here I need to check the value of current_user (who is identified by the connection) and make sure that they are authorized
  #     if current_user = User.find_by()
  #       current_user
  #     else
  #       reject_unauthorized_connection
  #     end
  #   end
  end
end
