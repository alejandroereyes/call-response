class User < ActiveRecord::Base

  def self.view_user_info(request, params)

    if params[:id] != nil #search using id
      if User.exists?(id: params[:id])
        users = User.where(id: params[:id])
        ok_200
        display_info(users)
        puts
      else
        error_404
      end
    else # if not searching using id

      # set query parameter variables
      first_name_value = params.key?(:first_name) ? "#{params[:first_name]}%" : "%%"
      last_name_value = params.key?(:last_name) ? "#{params[:last_name]}%" : "%%"
      age_value = params.key?(:age) ? params[:age] : "%%"
      limit_value = params.key?(:limit) ? params[:limit] : -1
      offset_value = params.key?(:offset) ? params[:offset] : 0

      if User.exists?(['first_name LIKE ?', first_name_value])
        users = User.where(["first_name LIKE ? AND last_name LIKE ? AND age LIKE ?",
                            first_name_value, last_name_value, age_value]).
                            offset(offset_value).
                            limit(limit_value)
        ok_200
        display_info(users)
      else
       error_404
      end
    end
  end # view_user_info_method

  private

  def self.display_info(users)
    puts "User              Age"
    puts "---------------------"
    users.each{ |user| puts "#{user.first_name} #{user.last_name} - #{user.age}" }
  end

  def self.ok_200
    puts "200 OK"
  end

  def self.error_404
    puts "404"
    puts "Not Found"
    puts
  end
end # class
