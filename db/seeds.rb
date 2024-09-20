# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
p "Delete News"
Actuality.destroy_all
# p "Delete Events"
# Event.destroy_all
# p "Delete Users"
User.destroy_all
p "Launching Seeds"
user=User.create!(
  email: 'leduc.vicente@free.fr',
  password: 'jeangab11'
)

Actuality.create!(
  content: 'Saison 2023-2024 : Les cours ont lieu aux dojos : Le lundi soir de 19h30 à 21h30 Au Gymnase Pierre de Coubertin, 4 Rue Jacques Anquetil, 11400 Castelnaudary.
            Le jeudi soir de 20h00 à 22h00 au Complexe Sportif Le Millénaire, Rue Anatole France, 11400 Castelnaudary.',
  user: user
)

Actuality.create!(
  content: "Les cours de Ki-Aïkido ont lieu au Complexe Sportif Le Millénaire ainsi qu'au Gymnase de Coubertin à Castelnaudary.
            Si vous êtes intéressez, les deux premiers cours sont gratuits.",
  user: user
)
p "Seeds created"
