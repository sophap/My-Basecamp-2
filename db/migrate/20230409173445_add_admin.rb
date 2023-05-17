class AddAdmin < ActiveRecord::Migration[7.0]
  def change
    User.create! do |u|
      u.name = 'sophie'
      u.email = 'sophie@test.com'
      u.password = 'soph123'
      u.admin = true
    end
  end
end
