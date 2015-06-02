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
      # set query parameters
      first_name = params.key?(:first_name) ? "#{params[:first_name]}%" : "%%"
      last_name = params.key?(:last_name) ? "#{params[:last_name]}%" : "%%"
      age = params.key?(:age) ? params[:age] : "%%"
      #where.('age LIKE limit') - example
      limit = params.key?(:limit) ? params[:limit] : -1
      #limit(-1) - example
      offset = params.key?(:offset) ? params[:offset] : 0
      #User.all.offset(0) - example

      if User.exists?(['first_name LIKE ?', first_name])
        users = User.where("first_name LIKE '#{first_name}'")
        ok_200
        users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
        puts
      else
       error_404
      end
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
