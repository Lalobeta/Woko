users = [
    {email: 'thomas@example.com',first_name: 'Thomas', last_name: 'Bush', admin: true, bio: 'HEY!'},
    {email: 'bear@example.com',first_name: 'Bear', last_name: 'Bush', admin: false, bio:'WOOF!'},
]

users.each do |user|
    this_user = User.where(
        email: user[:email],
    ).first_or_initialize

    this_user.update!(
        first_name: user[:first_name],
        last_name: user[:last_name],
        admin: user[:admin],
        password: SecureRandom.uuid,
    )
    this_user.save
end