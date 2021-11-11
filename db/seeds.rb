def create_user
  User.create(
      email: 'gg@gg.fr',
      password: 'oussama',
      password_confirmation: 'oussama'
    )
end

def delete_models
  User.destroy_all
  UserProfile.destroy_all
end

delete_models
p "delete user and user profile #{User.count} - #{UserProfile.count}"
create_user
p "Ajout user and user profile #{User.count} - #{UserProfile.count}"

