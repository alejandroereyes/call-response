class User < ActiveRecord::Base

  def self.view_user_info(request, params)
    puts
    puts "200 OK"
    case request[:method]
    when "GET" then
      if params[:id] != nil
        User.where(name: params[:id])
      else
        users = User.all
        users.each do |user|
          puts "#{user.first_name} #{user.last_name} - #{user.age}"
        end
      end
    end
  end
end
