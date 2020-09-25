desc "populate roles"
task :populate_roles => :environment do
    Role.where(code: 'default').first_or_create.update(name: 'Default')
    Role.where(code: 'moderator').first_or_create.update(name: 'Moderator')
    Role.where(code: 'contributor').first_or_create.update(name: 'Contributor')
end

desc "set default role"
task :default_roles => :environment do
    default = Role.find_by(code: 'default')
    moderator = Role.find_by(code: 'moderator')
    contributor = Role.find_by(code: 'contributor')

    User.update_all(role_id: default.id)
    User.find_by(first_name: 'Bear', last_name: 'Bush').update(role_id: moderator.id)
    User.find_by(first_name: 'Thomas', last_name: 'Bush').update(role_id: contributor.id)
    User.find_by(first_name: 'Victor', last_name: 'Betancourt').update(role_id: moderator.id)
end

desc "role tasks"
task :roles_all => [ :populate_roles, :default_roles] do
    puts "Finished Role Tasks"
end