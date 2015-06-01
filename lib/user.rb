class User < ActiveRecord::Base

  def self.view_user_info(request, params)
    case request[:method]
    when "GET" then
      if params[:id] != nil
        users = User.where(id: params[:id])
        users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
      else
        users = User.all
        users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
        puts
      end
    end
  end
end
