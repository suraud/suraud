def import_users
  users = [
    { email: 'ud.usagi.daisuki@gmail.com', password: 'usagi-pierrot' }
  ]
  users.each do |u|
    user = User.where(email: u[:email]).first
    if user.nil? then
      user = User.new
      user.email = u[:email]
      user.password = u[:password]
      user.role = 'admin'
      user.skip_confirmation!
      user.save
    end
  end
end

import_users
