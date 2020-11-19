desc "populate roles"
task :populate_roles => :environment do
  Role.where(code: 'member').first_or_create.update(name: 'Member')
  Role.where(code: 'author').first_or_create.update(name: 'Author')
  Role.where(code: 'moderator').first_or_create.update(name: 'Moderator')
  Role.where(code: 'admin').first_or_create.update(name: 'Admin')
end

desc "set default role"
task :default_roles => :environment do
  member = Role.find_by(code: 'member')
  author = Role.find_by(code: 'author')
  moderator = Role.find_by(code: 'moderator')
  admin = Role.find_by(code: 'admin')

  User.update_all(role_id: member.id)
end

desc "role tasks"
task :roles_all => [:populate_roles, :default_roles] do
  puts "Finished Role Tasks"
end