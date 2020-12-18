Faker::Config.locale = 'fr'

User.delete_all
Garden.delete_all
Post.delete_all
Tag.delete_all
PostComment.delete_all
GardenComment.delete_all
Climate.delete_all
GardenType.delete_all
Location.delete_all
Follow.delete_all
Event.delete_all
Testimony.delete_all
GardenTag.delete_all
PostTag.delete_all

User.reset_pk_sequence
Garden.reset_pk_sequence
Post.reset_pk_sequence
Tag.reset_pk_sequence
PostComment.reset_pk_sequence
GardenComment.reset_pk_sequence
Climate.reset_pk_sequence
GardenType.reset_pk_sequence
Location.reset_pk_sequence
Follow.reset_pk_sequence
Event.reset_pk_sequence
Testimony.reset_pk_sequence
GardenTag.reset_pk_sequence
PostTag.reset_pk_sequence

# ARRAYS
climate_array = ["Tropical", "Méditerranéen", "Continental"]
garden_type_array = ["Urbain", "Rural"]
french_departments = [
  "Aisne",
  "Allier",
  "Alpes-de-Haute-Provence",
  "Hautes-Alpes",
  "Alpes-Maritimes",
  "Ardèche",
  "Ardennes",
  "Ariège",
  "Aube",
  "Aude",
  "Aveyron",
  "Bouches-du-Rhône",
  "Calvados",
  "Cantal",
  "Charente",
  "Charent-Maritime",
  "Cher",
  "Corrèze",
  "Corse-du-Sud",
  "Haute-Corse",
  "Côte-d'Or",
  "Côtes d'Armor",
  "Creuse",
  "Dordogne",
  "Doubs",
  "Drôme",
  "Eure",
  "Eure-et-Loir",
  "Finistère",
  "Gard",
  "Haute-Garonne",
  "Gers",
  "Gironde",
  "Hérault",
  "Ille-et-Vilaine",
  "Indre",
  "Indre-et-Loire",
  "Isère",
  "Jura",
  "Landes",
  "Loir-et-Cher",
  "Loire",
  "Haute-Loire",
  "Loire-Atlantique",
  "Loiret",
  "Lot",
  "Lot-et-Garonne",
  "Lozère",
  "Maine-et-Loire",
  "Manche",
  "Marne",
  "Haute-Marne",
  "Mayenne",
  "Meurthe-et-Moselle",
  "Meuse",
  "Morbihan",
  "Moselle",
  "Nièvre",
  "Nord",
  "Oise",
  "Orne",
  "Pas-de-Calais",
  "Puy-de-Dôme",
  "Pyrénées-Atlantiques",
  "Hautes-Pyrénées",
  "Pyrénées-Orientales",
  "Bas-Rhin",
  "Haut-Rhin",
  "Rhône",
  "Haute-Saône",
  "Saône-et-Loire",
  "Sarthe",
  "Savoie",
  "Haute-Savoie",
  "Paris",
  "Seine-Maritime",
  "Seine-et-Marne",
  "Yvelines",
  "Deux-Sèvres",
  "Somme",
  "Tarn",
  "Tarn-et-Garonne",
  "Var",
  "Vaucluse",
  "Vendée",
  "Vienne",
  "Haute-Vienne",
  "Vosges",
  "Yonne",
  "Territoire de Belfort",
  "Essonne",
  "Hauts-de-Seine",
  "Seine-St-Denis",
  "Val-de-Marne",
  "Val-D'Oise",
  "Guadeloupe",
  "Martinique",
  "Guyane",
  "La Réunion",
  "Mayotte"
]

gardens_pictures_urls = ["https://images.unsplash.com/photo-1598902108854-10e335adac99?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80", "https://images.unsplash.com/photo-1536236010565-78fbb2fb25d5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1591857177580-dc82b9ac4e1e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80", "https://images.unsplash.com/photo-1584479898061-15742e14f50d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1595182747083-6d249e14f0fa?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1516253593875-bd7ba052fbc5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1508101279722-c8515399cf03?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80", "https://images.unsplash.com/photo-1598106557015-a1ed63c6a4c0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTg4fHx2ZWdldGFibGUlMjBnYXJkZW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1603479724841-b10d04f8b9d3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1995&q=80", "https://images.unsplash.com/photo-1575527820586-5f350ab37c6f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1589876568181-a1508b8ef473?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1353&q=80", "https://images.unsplash.com/photo-1566938064504-a379175168b3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1586973831237-7d8dd03a996f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1527863280617-15596f92e5c8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1490187763999-9f273a5b7516?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1553481839-a18af44d1355?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1571650452488-b9756cd1a4f3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1581058196947-ac012b40ea76?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80", "https://images.unsplash.com/photo-1592150621744-aca64f48394a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1368&q=80", "https://images.unsplash.com/photo-1597478846144-8d67b68d4da4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80", "https://images.unsplash.com/photo-1510266009730-c72c57421300?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"]
posts_pictures_urls = ["https://images.unsplash.com/photo-1416879595882-3373a0480b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80", "https://images.unsplash.com/photo-1461354464878-ad92f492a5a0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1438109382753-8368e7e1e7cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1534811939961-e17907ba11c4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1399&q=80", "https://images.unsplash.com/photo-1508767279710-1445ad3b14d6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1426&q=80", "https://images.unsplash.com/photo-1589282119070-29158325f88f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1567566711600-0c918f109afa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1504945005722-33670dcaf685?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80", "https://images.unsplash.com/photo-1543765891-68953265e5ca?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHZlZ2V0YWJsZXMlMjBiaW98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1576398764960-f9d9e9071cda?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80", "https://images.unsplash.com/photo-1581515286348-98549702050f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80", "https://images.unsplash.com/photo-1535567518866-8330cb0a51ec?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1353&q=80", "https://images.unsplash.com/photo-1601758174114-e711c0cbaa69?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1565248378581-1c1fa32e59e2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1603140682066-ecbcf084af1d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80", "https://images.unsplash.com/photo-1606946252940-938437468f1f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80", "https://images.unsplash.com/photo-1598335624134-5bceb5de202d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80", "https://images.unsplash.com/photo-1546757888-ae3779dc24c0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80", "https://images.unsplash.com/photo-1591531250421-324cce34ddd8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80", "https://images.unsplash.com/photo-1534803568648-d7e3611d0875?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1538363441790-c20471982e92?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGFuaW1hbHMlMjBnYXJkZW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1581578404742-533f1b6b6cf3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80", "https://images.unsplash.com/photo-1513777831036-c59d576a6598?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1266&q=80"]
post_comments = ["FIRST", "J'adore !", "C'est une super idée, merci du partage !", "lol", "Très joli !", "Ooh, comment tu as fait ça ?", "Je n'aurais pas fait ça comme ça...", "Malin !", "Excellent, j'ai fais exactement la même chose dans mon potager !", "Bravo !", "Très belles tomates !", "Tu te prends pas un peu trop le choux par hasard ?", "ça donne la patate !", "ça me donne la pêche !", "ça me donne la banane !", "Je ne vais peut-être pas ramener ma fraise", "Et t'es pas tombé dans les pommes avec tout ça ?", "On peut dire qu'il s'est pris un rateau...", "Manquerait plus qu'un roulage de pelles...", "Enchanté, je m'appelle Teuse", "... -Et moi Sonneuse !", "L'herbe est toujours plus verte dans le jardin d'à côté", "Bête comme un chou !", "Arrête de nous raconter des salades", "Cette fois, les carottes sont cuites !", "Il a mangé les pissenlits par la racine", "C'est la fin des haricots !", "T'as pas poireaté trop longtemps ?", "C'est chou, il est haut comme trois pommes !", "Avec tout ça, manquerait plus que tu fasses chou blanc", "Un sacré coeur d'artichaud quand même !", "Tu aurais peut-être dû couper la poire en deux", "C'est vrai que ça ne compte pas pour des prunes", "T'es pas un peu bonne poire ?", "Attention à ne pas recevoir de châtaignes", "Et moi qui n'ai plus un radis...", "Wow, la cerise sur le gâteau !", "On peut dire qu'il ne travaille pas pour des prunes", "Sacrés bouts de chou !", "Ce melon qu'il a !", "ça me court sur le haricot", "Il a tellement de blé", "je me fends bien la poire", "Ce ne sont pas mes oignons !", "Occupe-toi de tes oignons", "Trop chou", "C'est vrai que c'est bête comme chou", "Un beau jardin secret", "C'est une sacré fleur, que tu nous fais !", "Je ne voudrais pas te jeter des fleurs, mais c'est très joli", "Prenez-en de la graine", "tout ça, sans dépenser un seul radis", "Il ne faut quand même pas pousser mémé dans les orties"]

# USER
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "azerty",
    password_confirmation: "azerty",
    is_admin: false
  )
  user.email = user.first_name + "@yopmail.com"
  user.username = user.first_name.downcase + "_" + user.last_name.downcase
  user.save
  puts "user #{user.id} created"
end

User.create(first_name: "Fli",
  last_name: "bustier",
  username: "flibusrier",
  email: "flibustier@yopmail.com",
  password: "azerty",
  password_confirmation: "azerty",
  is_admin: true
)
puts "Flibustier created"

# CLIMATE
i=0
3.times do
  Climate.create(
    name: climate_array[i]
  )
  i+=1
end


# LOCATION

french_departments.sort{|a,b| a <=> b }.each do |department|
  Location.create(
    name: department,
  )
end

# GARDEN TYPE
j=0
2.times do
  GardenType.create(
    name: garden_type_array[j]
  )
  j+=1
end

# GARDEN
gardens_pictures_urls.each do |picture_url|
  garden = Garden.create(
    name: Faker::Games::Minecraft.biome,
    area: rand(1..150),
    user: User.all.sample,
    location: Location.all.sample,
    climate: Climate.all.sample,
    garden_type: GardenType.all.sample,
    description: Faker::Books::Dune.quote,
    picture_url: picture_url
  )
  puts "Garden #{garden.id} created"
end

# TAG
5.times do
  Tag.create(
    name: Faker::Space.constellation
  )
end

# POST
60.times do
  post = Post.new(
    title: Faker::Space.galaxy,
    content: Faker::Books::Dune.quote,
    garden: Garden.all.sample
  )

  has_pictures = [true, false].sample

  if has_pictures
    pictures_urls = []

    rand(1..4).times do
      pictures_urls << posts_pictures_urls.sample
    end

    post.pictures_url = pictures_urls
  end

  post.save
end

# GARGEN TAG
20.times do
    GardenTag.create(
      garden: Garden.all.sample,
      tag: Tag.all.sample
    )
end

# POST TAG
10.times do
  PostTag.create(
    post: Post.all.sample,
    tag: Tag.all.sample
  )
end

# GARDEN COMMENT
30.times do
  GardenComment.create(
    content: Faker::Lorem.sentences,
    user: User.all.sample,
    garden: Garden.all.sample
  )
end

# POST COMMENT
post_comments.each do |comment|
  PostComment.create(
    content: comment,
    user: User.all.sample,
    post: Post.all.sample
  )
end

# FOLLOW
30.times do
  follow = Follow.create(
    user: User.all.sample,
    garden: Garden.all.sample
  )
  puts "Follow #{follow.id} created"
end

# EVENT
50.times do
  Event.create(
    name:Faker::Lorem.sentence,
    description: Faker::Lorem.sentences,
    garden: Garden.all.sample,
    start_date: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
    end_date: Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 5, period: :all)
  )
end

# TESTIMONY
5.times do
  Testimony.create(
    content: Faker::Lorem.sentences,
    user: User.all.sample
  )
end

# GARDEN LIKE
30.times do
  gardenlike = GardenLike.create(
    user: User.all.sample,
    garden: Garden.all.sample
  )
  puts "GardenLike #{gardenlike.id} created"
end

# WARNINGS
3.times do 
  User.all.sample.update(warning: true)
  Garden.all.sample.update(warning: true)
  Post.all.sample.update(warning: true)
  GardenComment.all.sample.update(warning: true)
  PostComment.all.sample.update(warning: true)
  Event.all.sample.update(warning: true)
 end