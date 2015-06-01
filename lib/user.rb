class User < ActiveRecord::Base

  def self.view_user_info(request, params)

    if params[:id] != nil #search using id
      if User.exists?(id: params[:id])
        users = User.where(id: params[:id])
        ok_200
        users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
        puts
      else
        error_404
      end
    else # if not searching using id
      # if User.exists?(first_name: params[:first_name])
        users = User.where("first_name LIKE '#{params[:first_name]}%'")
        ok_200
        users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
        puts
      # else
       # error_404
      # end
    end
  end # view_user_info_method

  private
  def self.ok_200
    puts "200 OK"
  end

  def self.error_404
    puts "404"
    puts "Not Found"
    puts
  end
end # class
