class User < ActiveRecord::Base

  def self.view_user_info(request, params)
    case request[:method]
    when "GET" then
      if params[:id] != nil
        if User.exists?(id: params[:id])
          users = User.where(id: params[:id])
          puts "200 OK"
          users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
          puts
        else
          puts "404"
          puts "Not Found"
          puts
        end
      else
        users = User.all
        puts "200 OK"
        users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
        puts
      end
    end
  end
end
