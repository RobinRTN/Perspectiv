# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'aws-sdk-s3'
require 'open-uri'

puts "Deleting experiences"
Experience.destroy_all

puts "Deleting educations"
Education.destroy_all

puts "Deleting institutions"
Institution.destroy_all

puts "Deleting contents"
Content.destroy_all

puts "Deleting messages"
Message.destroy_all

puts "Deleting meetings"
Meeting.destroy_all

puts "Deleting conversations"
Conversation.destroy_all

puts "Deleting preferences"
Preference.destroy_all

puts "Deleting students"
User.student.destroy_all

puts "Deleting professionals"
User.mentor.destroy_all

puts "Deleting tags"
Tag.destroy_all

puts "Creating students"
s1 = User.create!(first_name: "Gabriel", last_name: "de Monts", age: 17, email: "gabriel@gmail.com", password: "123456", description: "Bachelier en quete de renseignements sur l'industrie du luxe", status: :student)
s2 = User.create!(first_name: "Robin", last_name: "Rettien", age: 17, email: "robin@gmail.com", password: "123456", description: "Bachelier en quete d'une formation qui permettra de faire de l'argent très rapidement", status: :student)
s3 = User.create!(first_name: "Shayneze", last_name: "Megady", age: 16, email: "shayneze@gmail.com", password: "123456", description: "Etudiante à la recherche de renseignements sur le métier d'avocat", status: :student)
s4 = User.create!(first_name: "Mehdi", last_name: "Rachid", age: 18, email: "mehdi@gmail.com", password: "123456", description: "Intéréssé par le développement web", status: :student)
s5 = User.create!(first_name: "Kevin", last_name: "Blakime", age: 17, email: "kevin@gmail.com", password: "123456", description: "Futur chef en quete de skills de cheffing", status: :student)
s6 = User.create!(first_name: "Jean", last_name: "Dupont", age: 18, email: "jeanot@gmail.com", password: "123456", description: "Fan de photo", status: :student)
s7 = User.create!(first_name: "Nicolas", last_name: "Bernard", age: 19, email: "nicolas@gmail.com", password: "123456", description: "J'aimerais tout quitter pour me lancer dans le rap", status: :student)
s8 = User.create!(first_name: "Julie", last_name: "Martin", age: 16, email: "julie@gmail.com", password: "123456", description: "J'aimerais faire une carrière au service de l'Etat", status: :student)
s9 = User.create!(first_name: "Madeleine", last_name: "Robert", age: 17, email: "madeleine@gmail.com", password: "123456", description: "Intéréssée par le marketing et la grande conso", status: :student)
s10 = User.create!(first_name: "Baptiste", last_name: "Durand", age: 18, email: "baptiste@gmail.com", password: "123456", description: "Etudiant intéréssé par le batiment", status: :student)

# attaching pictures to students
s1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803288/qn4qjgv7q2lquqa1cgx3.jpg'),
  filename: 'gabriel.jpg',
  content_type: 'image/jpg'
)
s1.save!

s2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803357/ct7e9izj5jwelwkqoizi.jpg'),
  filename: 'robin.jpg',
  content_type: 'image/jpg'
)
s2.save!

s3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803367/y7ir5np0tztniz27u2rm.jpg'),
  filename: 'sous-chef.jpg',
  content_type: 'image/jpg'
)
s3.save!

s4.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803333/exalou60pwikuldrw3ly.jpg'),
  filename: 'mehdi.jpg',
  content_type: 'image/jpg'
)
s4.save!

s5.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803259/wu3egmhzkft5vzn2mguf.jpg'),
  filename: 'chef.jpg',
  content_type: 'image/jpg'
)
s5.save!

s6.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803297/jfk8mbnj9zb7zqrbyxa8.jpg'),
  filename: 'jean.jpg',
  content_type: 'image/jpg'
)
s6.save!

s7.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803341/lebnltmamr4a6xdlwbac.jpg'),
  filename: 'nicolas.jpg',
  content_type: 'image/jpg'
)
s7.save!

s8.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803312/ttucxb1ainldeqsxakhg.jpg'),
  filename: 'julie.jpg',
  content_type: 'image/jpg'
)
s8.save!

s9.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669803322/j5dn4jjlzc9hwqau5sbn.jpg'),
  filename: 'madeleine.jpg',
  content_type: 'image/jpg'
)
s9.save!

s10.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669807643/yhxcgyozwgqucooasmko.jpg'),
  filename: 'baptiste.jpg',
  content_type: 'image/jpg'
)
s10.save!

# mentors
puts "Creating mentors"
m1 = User.new(first_name: "Sophie", last_name: "Portier", age: 30, email: "sophie@gmail.com", password: "123456", description: "Meilleur dev en région parisienne, ancienne photographe", status: :mentor)
m7 = User.new(first_name: "Océane", last_name: "Gunasena", age: 29, email: "oceane@gmail.com", password: "123456", description: "Chef de projet digital chez Colorz", status: :mentor)
m8 = User.new(first_name: "Hélène", last_name: "Michel", age: 26, email: "helene@gmail.com", password: "123456", description: "Data analyst chez Cenisis", status: :mentor)
m9 = User.new(first_name: "Jean", last_name: "Jahier", age: 27, email: "jeanj@gmail.com", password: "123456", description: "Business developper chez Mirakl", status: :mentor)
m10 = User.new(first_name: "Pascal", last_name: "Traoré", age: 32, email: "pascal@gmail.com", password: "123456", description: "Chef de chantier chez Sferis, ancien policier", status: :mentor)
m11 = User.new(first_name: "Christophe", last_name: "Tranier", age: 39, email: "christophe@gmail.com", password: "123456", description: "Senior product manager, ancien consultant chez PwC", status: :mentor)
m12 = User.new(first_name: "Mihaela", last_name: "Riza", age: 31, email: "mihaela@gmail.com", password: "123456", description: "Senior account executive, ancienne account executive", status: :mentor)
m13 = User.new(first_name: "Camille", last_name: "Miko", age: 31, email: "camille@gmail.com", password: "123456", description: "Actuaire chez Crédit Agricole Assurances", status: :mentor)
m14 = User.new(first_name: "Fatima", last_name: "Diallo", age: 27, email: "fatima@gmail.com", password: "123456", description: "Data analyst chez Kapten, ancienne consultante data chez KPMG", status: :mentor)
m15 = User.new(first_name: "Maëlis", last_name: "De Witte", age: 34, email: "maëlis@gmail.com", password: "123456", description: "Co-fondatrice de Binhappy", status: :mentor)

m16 = User.new(first_name: "Charline", last_name: "De monts", age: 30, email: "charline@gmail.com", password: "123456", description: "Chargé de marketing chez Binhappy", status: :mentor)
m17 = User.new(first_name: "Audrey", last_name: "Devillier", age: 28, email: "audrey@gmail.com", password: "123456", description: "Chargé de mission de sensibiliation", status: :mentor)
m18 = User.new(first_name: "Antonin", last_name: "Smith", age: 29, email: "antonin@gmail.com", password: "123456", description: "Chargé de mission RSE", status: :mentor)
m19 = User.new(first_name: "Séverine", last_name: "Martin", age: 42, email: "severine@gmail.com", password: "123456", description: "Chef de projet Eco responsable", status: :mentor)
m20 = User.new(first_name: "Alexandre", last_name: "Legrand", age: 48, email: "alexandre@gmail.com", password: "123456", description: "Academy director", status: :mentor)
m21 = User.new(first_name: "Cyprien", last_name: "Bernard", age: 32, email: "cyprien@gmail.com", password: "123456", description: "Junior impact Maker", status: :mentor)
m22 = User.new(first_name: "Isabelle", last_name: "Petit", age: 31, email: "isabelle@gmail.com", password: "123456", description: "Fondatrice & PDG chez Goodness & Co", status: :mentor)
m23 = User.new(first_name: "Stéphane", last_name: "Paillard", age: 43, email: "stephane@gmail.com", password: "123456", description: "PDG chez Agily", status: :mentor)
m24 = User.new(first_name: "Vanessa", last_name: "Dupuy", age: 26, email: "vanessa@gmail.com", password: "123456", description: "Talent acquisition Manager", status: :mentor)
m25 = User.new(first_name: "Théo", last_name: "Gonzales", age: 25, email: "theo@gmail.com", password: "123456", description: "Chief Sales Officer", status: :mentor)
m26 = User.new(first_name: "Emilien", last_name: "Deschamps", age: 23, email: "emilien@gmail.com", password: "123456", description: "Business developer", status: :mentor)
m27 = User.new(first_name: "Caroline", last_name: "Morel", age: 37, email: "caroline@gmail.com", password: "123456", description: "Directrice Générale Adjointe", status: :mentor)
m28 = User.new(first_name: "Mourad", last_name: "Abderrahmane", age: 34, email: "mourad@gmail.com", password: "123456", description: "Responsable support applicatif", status: :mentor)
m29 = User.new(first_name: "Marine", last_name: "Lambert", age: 26, email: "marine@gmail.com", password: "123456", description: "Controleur de gestion", status: :mentor)
m30 = User.new(first_name: "Tania", last_name: "Da Silva", age: 29, email: "tania@gmail.com", password: "123456", description: "Directrice commerciale", status: :mentor)
m31 = User.new(first_name: "Bob", last_name: "Pages", age: 41, email: "bob@gmail.com", password: "123456", description: "PDG chez Satelia", status: :mentor)
m32 = User.new(first_name: "Ludovic", last_name: "Nay", age: 28, email: "ludovic@gmail.com", password: "123456", description: "Responsable culture et expérience collaborateur", status: :mentor)
m33 = User.new(first_name: "Aurélie", last_name: "Fontaine", age: 22, email: "aurelie@gmail.com", password: "123456", description: "Infirmière", status: :mentor)
m34 = User.new(first_name: "Sami", last_name: "Achour", age: 33, email: "sami@gmail.com", password: "123456", description: "Gestionnaire middle office", status: :mentor)
m35 = User.new(first_name: "Marie", last_name: "Charles", age: 28, email: "marie@gmail.com", password: "123456", description: "Responsable adjointe service produits nominatifs", status: :mentor)
m36 = User.new(first_name: "Jade", last_name: "Lefevre", age: 27, email: "jade@gmail.com", password: "123456", description: "Chargée de gestion", status: :mentor)
m37 = User.new(first_name: "Manon", last_name: "Brisse", age: 25, email: "manon@gmail.com", password: "123456", description: "Responsable communication et RSE", status: :mentor)
m38 = User.new(first_name: "Clément", last_name: "Feutry", age: 32, email: "clement@gmail.com", password: "123456", description: "Consultant et chercheur", status: :mentor)
m39 = User.new(first_name: "Guillaume", last_name: "Provost", age: 38, email: "guillaume@gmail.com", password: "123456", description: "Directeur des opérations", status: :mentor)
m40 = User.new(first_name: "Maÿlis", last_name: "Germain", age: 23, email: "maÿlis@gmail.com", password: "123456", description: "Cheffe de projet pédagogique", status: :mentor)
m41 = User.new(first_name: "Elias", last_name: "Menuier", age: 33, email: "elias@gmail.com", password: "123456", description: "Business Manager", status: :mentor)
m42 = User.new(first_name: "Morgane", last_name: "Marchal", age: 26, email: "morgane@gmail.com", password: "123456", description: "Gestionnaire des affaires réglementaires à Montréal", status: :mentor)
m43 = User.new(first_name: "Sofia", last_name: "Zakraoui", age: 27, email: "sofia@gmail.com", password: "123456", description: "Toxicologue", status: :mentor)
m44 = User.new(first_name: "Gaby", last_name: "Gillet", age: 32, email: "gaby@gmail.com", password: "123456", description: "Directeur Sommellerie", status: :mentor)
m45 = User.new(first_name: "Rosalie", last_name: "Boucher", age: 27, email: "rosalie@gmail.com", password: "123456", description: "Sous-cheffe Pâtisserie", status: :mentor)
m46 = User.new(first_name: "Valentine", last_name: "Carrière", age: 31, email: "valentine@gmail.com", password: "123456", description: "Attachée de Direction Expérience Clients", status: :mentor)
m47 = User.new(first_name: "Noémie", last_name: "Boissier", age: 31, email: "noemie@gmail.com", password: "123456", description: "Responsable Optimisation", status: :mentor)
m48 = User.new(first_name: "Lucile", last_name: "Deprez", age: 29, email: "lucile@gmail.com", password: "123456", description: "Responsable Communication", status: :mentor)
m49 = User.new(first_name: "Valentin", last_name: "Dubois", age: 32, email: "valentin@gmail.com", password: "123456", description: "Manager des ventes", status: :mentor)
m50 = User.new(first_name: "Chérine", last_name: "Touré", age: 29, email: "cherine@gmail.com", password: "123456", description: "Responsable Evaluation Sécurité Produits", status: :mentor)

# attaching pictures to students
m1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669982051/ueowxt5l5hdgyllf6r75.webp'),
  filename: 'sophie.jpg',
  content_type: 'image/jpg'
)
m1.save!

m7.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669975053/xpjv7ckkpwasaxiy3du2.webp'),
  filename: 'oceane.jpg',
  content_type: 'image/webp'
)
m7.save!

m8.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669976407/a20bggkthep6l8w3nky1.webp'),
  filename: 'helene.jpg',
  content_type: 'image/webp'
)
m8.save!

m9.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669977102/lghrbgs1wxbwduptncqt.webp'),
  filename: 'jeanj.jpg',
  content_type: 'image/webp'
)
m9.save!

m10.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669977907/pezukn5tcekodbma0qvq.webp'),
  filename: 'pascal.jpg',
  content_type: 'image/webp'
)
m10.save!

m11.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669979805/pmytwbjmuhk3gfct4xqb.webp'),
  filename: 'christophe.jpg',
  content_type: 'image/webp'
)
m11.save!

m12.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1669979233/serqv8puyodpivlgcj4b.webp'),
  filename: 'riza.jpg',
  content_type: 'image/webp'
)
m12.save!

m13.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670239959/eo9an7o3lb1fdb5itt82.jpg'),
  filename: 'camille.jpg',
  content_type: 'image/jpg'
)
m13.save!

m14.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670241276/pbc1zig4xf0aqcemju5g.webp'),
  filename: 'fatima.jpg',
  content_type: 'image/webp'
)
m14.save!

m15.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670406764/s98wom3lqjkvhqhtzmks.webp'),
  filename: 'maëlis.jpg',
  content_type: 'image/webp'
)
m15.save!

m16.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670413781/dpcvrey1oivklok6b8vm.webp'),
  filename: 'charline.jpg',
  content_type: 'image/webp'
)
m16.save!

m17.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670413859/u3gsp1lzeeoqdkgfthop.webp'),
  filename: 'audrey.jpg',
  content_type: 'image/webp'
)
m17.save!

m18.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670413883/samrrzy7axjpzy6tqhzh.webp'),
  filename: 'antonin.jpg',
  content_type: 'image/webp'
)
m18.save!

m19.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670413917/vpfkqg6egt0m4yve7jvz.webp'),
  filename: 'severine.jpg',
  content_type: 'image/webp'
)
m19.save!

m20.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670413958/xwtatq7wnxtbsgriqdu1.webp'),
  filename: 'alexandre.jpg',
  content_type: 'image/webp'
)
m20.save!

m21.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670413982/cu0plb8m8aihrjra6h6s.webp'),
  filename: 'cyprien.jpg',
  content_type: 'image/webp'
)
m21.save!

m22.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419181/ruonyd6eci24ze8qgi6d.webp'),
  filename: 'isabelle.jpg',
  content_type: 'image/webp'
)
m22.save!

m23.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419264/e0qbptrfrqmov4qvwoyh.webp'),
  filename: 'stephane.jpg',
  content_type: 'image/webp'
)
m23.save!

m24.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419307/ububquxqgmwynx3zxaj9.webp'),
  filename: 'vanessa.jpg',
  content_type: 'image/webp'
)
m24.save!

m25.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419370/jmuvd7cxzug6udev3fee.webp'),
  filename: 'theo.jpg',
  content_type: 'image/webp'
)
m25.save!

m26.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419407/orjse0tzijvotg6catcj.webp'),
  filename: 'emilien.jpg',
  content_type: 'image/webp'
)
m26.save!

m27.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419450/j6kdxt53qwpme5y0inym.webp'),
  filename: 'caroline.jpg',
  content_type: 'image/webp'
)
m27.save!

m28.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419668/dqd1b03w1uqhnmglipy0.webp'),
  filename: 'mourad.jpg',
  content_type: 'image/webp'
)
m28.save!

m29.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419728/jzrncmvvliuxrpickgg9.webp'),
  filename: 'marine.jpg',
  content_type: 'image/webp'
)
m29.save!

m30.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419758/kgfmpj6zdlwe1as6ubtb.webp'),
  filename: 'tania.jpg',
  content_type: 'image/webp'
)
m30.save!

m31.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670419906/ngncpcvdwrlz85xfnttm.webp'),
  filename: 'nicolas.jpg',
  content_type: 'image/webp'
)
m31.save!

m32.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421653/yzbuidwhinfmna8dfwzl.webp'),
  filename: 'ludovic.jpg',
  content_type: 'image/webp'
)
m32.save!

m33.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421714/tf2ypefqbq26cxbhahw3.webp'),
  filename: 'aurelie.jpg',
  content_type: 'image/webp'
)
m33.save!

m34.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421766/f8zewldwom9kvc9zqw20.webp'),
  filename: 'sami.jpg',
  content_type: 'image/webp'
)
m34.save!

m35.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421794/oadasn3stfqe8x6dcpk3.webp'),
  filename: 'marie.jpg',
  content_type: 'image/webp'
)
m35.save!

m36.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421823/bw8r6cqjiim1y3fxtpmr.webp'),
  filename: 'jade.jpg',
  content_type: 'image/webp'
)
m36.save!

m37.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421852/shnenh8go2fmtkjikfhf.webp'),
  filename: 'manon.jpg',
  content_type: 'image/webp'
)
m37.save!

m38.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421899/cb2sxksyviwbdcq9bpy5.webp'),
  filename: 'clement.jpg',
  content_type: 'image/webp'
)
m38.save!

m39.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421942/hszqx6lty5auyriwi1ed.webp'),
  filename: 'guillaume.jpg',
  content_type: 'image/webp'
)
m39.save!

m40.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670421972/glwjhp6dyj5i0bczqtsn.webp'),
  filename: 'maylis.jpg',
  content_type: 'image/webp'
)
m40.save!

m41.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670422002/w7imapvscsziemrkxxwm.webp'),
  filename: 'elias.jpg',
  content_type: 'image/webp'
)
m41.save!

m42.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670422034/q0tcb4qtouo3bblmmxyu.webp'),
  filename: 'morgane.jpg',
  content_type: 'image/webp'
)
m42.save!

m43.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670423924/ckfumpfizkg51avotv6a.webp'),
  filename: 'sophia.jpg',
  content_type: 'image/webp'
)
m43.save!

m44.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670423975/hy99tvhmrj8ikmmq5hdj.webp'),
  filename: 'gaby.jpg',
  content_type: 'image/webp'
)
m44.save!

m45.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670424030/irttiywckcru2c2mojah.webp'),
  filename: 'rosalie.jpg',
  content_type: 'image/webp'
)
m45.save!

m46.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670424143/cce7rb2ls46eamwvgx37.webp'),
  filename: 'valentine.jpg',
  content_type: 'image/webp'
)
m46.save!

m47.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670424170/tzjdxvsojiah7udns79t.webp'),
  filename: 'noemie.jpg',
  content_type: 'image/webp'
)
m47.save!

m48.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670424398/aswgawvblqarbbctdzm5.webp'),
  filename: 'lucile.jpg',
  content_type: 'image/webp'
)
m48.save!

m49.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670424422/jiiiefsb8abchk5gr1qt.webp'),
  filename: 'valentin.jpg',
  content_type: 'image/webp'
)
m49.save!

m50.photo.attach(
  io: URI.open('https://res.cloudinary.com/dzkld2xzj/image/upload/v1670424462/aa9cj4kiijzz6rrwrz82.webp'),
  filename: 'cherine.jpg',
  content_type: 'image/webp'
)
m50.save!

puts "Creating experiences"
# creating experiences for Paul Portier
exp1 = Experience.create!(user_id: m1.id, position: "Lead software engineer", company: "Exotec", sector: "R&D", industry: "technologie", start_date: "2018-01-01")
exp2 = Experience.create!(user_id: m1.id, position: "Photographe", company: "Sophie & Co.", sector: "création", industry: "art", start_date: "2014-01-01")

exp13 = Experience.create!(user_id: m7.id, position: "Chef de projet digital", company: "Colorz", sector: "marketing", industry: "technologie", start_date: "2018-01-01")
exp14 = Experience.create!(user_id: m7.id, position: "Junior marketing manager", company: "Procter & Gamble", sector: "marketing", industry: "autre", start_date: "2016-01-01")
# creating experiences for Helene
exp15 = Experience.create!(user_id: m8.id, position: "Senior data analyst", company: "Cenisis", sector: "ingénierie", industry: "technologie", start_date: "2020-01-01")
exp16 = Experience.create!(user_id: m8.id, position: "Business analyst", company: "ManoMano", sector: "opérations", industry: "commerce", start_date: "2019-01-01")
# creating experiences for Jean
exp17 = Experience.create!(user_id: m9.id, position: "Business developper", company: "Mirakl", sector: "vente", industry: "technologie", start_date: "2020-01-01")
exp18 = Experience.create!(user_id: m9.id, position: "Libraire", company: "Libraire centrale", sector: "vente", industry: "culture", start_date: "2018-01-01")
# creating experiences for Pascal
exp19 = Experience.create!(user_id: m10.id, position: "Chef de chantier", company: "Sferis", sector: "manutention", industry: "BTP", start_date: "2017-01-01")
exp20 = Experience.create!(user_id: m10.id, position: "Policier", company: "Mairie de Lille", sector: "autre", industry: "administation", start_date: "2015-01-01")
# creating experiences for Jerome
exp21 = Experience.create!(user_id: m11.id, position: "Senior product manager", company: "Gens de confiance", sector: "opérations", industry: "technologie", start_date: "2017-01-01")
exp22 = Experience.create!(user_id: m11.id, position: "Consultant en stratégie", company: "PwC", sector: "conseil", industry: "services", start_date: "2013-01-01")
# creating experiences for Riza
exp23 = Experience.create!(user_id: m12.id, position: "Senior account executive", company: "Odaseva", sector: "vente", industry: "technologie", start_date: "2019-01-01")
exp24 = Experience.create!(user_id: m12.id, position: "Account executive", company: "Odaseva", sector: "vente", industry: "technologie", start_date: "2016-01-01")
# creating experiences for Camille
exp25 = Experience.create!(user_id: m13.id, position: "Actuaire", company: "Crédit Agricole Assurances", sector: "administration", industry: "assurance", start_date: "2019-01-01")
exp26 = Experience.create!(user_id: m13.id, position: "Actuaire", company: "Axa Assurances", sector: "administration", industry: "assurance", start_date: "2016-01-01")
# creating experiences for Fatima
exp27 = Experience.create!(user_id: m14.id, position: "Data Analyst", company: "Kapten", sector: "ingénierie", industry: "technologie", start_date: "2020-01-01")
exp28 = Experience.create!(user_id: m14.id, position: "Consultante Data", company: "KPMG", sector: "ingénierie", industry: "finance", start_date: "2018-01-01")

# creating experiences for Maëlis
exp29 = Experience.create!(user_id: m15.id, position: "PDG", company: "Binhappy", sector: "management", industry: "environnement", start_date: "2019-08-01")
exp30 = Experience.create!(user_id: m15.id, position: "Commercial", company: "Auchan", sector: "vente", industry: "commerce", start_date: "2017-01-18")

# creating experiences for Charline chargé de amrketing
exp31 = Experience.create!(user_id: m16.id, position: "Chargé de marketing", company: "Binhappy", sector: "marketing", industry: "environnement", start_date: "2019-08-01")
exp32 = Experience.create!(user_id: m16.id, position: "Vendeuse", company: "Apple", sector: "vente", industry: "commerce", start_date: "2017-01-18")

# creating experiences for Audrey chargé de mission de sensibilation
exp33 = Experience.create!(user_id: m17.id, position: "Chargé de mission", company: "Binhappy", sector: "management", industry: "environnement", start_date: "2022-01-10")
exp34 = Experience.create!(user_id: m17.id, position: "Agent de police", company: "Commissariat de police Paris 11", sector: "autre", industry: "défense", start_date: "2017-01-18")

# creating experiences for Antonin chargé de mission rse
exp35 = Experience.create!(user_id: m18.id, position: "Chargé de mission RSE", company: "Binhappy", sector: "management", industry: "écologie", start_date: "2022-01-10")
exp36 = Experience.create!(user_id: m18.id, position: "Agent immobilier", company: "Stéphan Plaza", sector: "vente", industry: "immobilier", start_date: "2017-01-18")

# creating experiences for Séverine chef de projet eco responsable
exp37 = Experience.create!(user_id: m19.id, position: "Chef de projet Eco", company: "Binhappy", sector: "management", industry: "écologie", start_date: "2022-01-10")
exp38 = Experience.create!(user_id: m19.id, position: "Agent de sécurité", company: "GK SECURITE", sector: "autre", industry: "défense", start_date: "2017-01-18")

# creating experiences for Alexandre academy director
exp39 = Experience.create!(user_id: m20.id, position: "Academy director", company: "Goodness & Co", sector: "direction", industry: "finance", start_date: "2022-01-10")
exp40 = Experience.create!(user_id: m20.id, position: "Conducteur de train", company: "SNCF", sector: "autre", industry: "ferroviaire", start_date: "2017-01-18")

# creating experiences for Cyprien junior imapct marker
exp41 = Experience.create!(user_id: m21.id, position: "Junior impact marker", company: "Goodness & Co", sector: "direction", industry: "finance", start_date: "2022-01-10")
exp42 = Experience.create!(user_id: m21.id, position: "Cuisinier", company: "Coco thai", sector: "autre", industry: "autre", start_date: "2017-01-18")

# creating experiences for Isabelle fondatrice pdg goodness
exp43 = Experience.create!(user_id: m22.id, position: "Fondatrice & PDG", company: "Goodness & Co", sector: "direction", industry: "finance", start_date: "2022-01-10")
exp44 = Experience.create!(user_id: m22.id, position: "Commercial", company: "Amazon", sector: "ingénierie", industry: "technologie", start_date: "2017-01-18")

# creating experiences for Stéphane pdg agily
exp45 = Experience.create!(user_id: m23.id, position: "PDG", company: "Agily", sector: "direction", industry: "commerce", start_date: "2022-01-10")
exp46 = Experience.create!(user_id: m23.id, position: "Commercial", company: "SFR", sector: "vente", industry: "commerce", start_date: "2017-01-18")

# creating experiences for Vanessa talent asquisition manager
exp47 = Experience.create!(user_id: m24.id, position: "Talent aquisition manager", company: "Lynkus", sector: "gestion", industry: "communication", start_date: "2022-01-10")
exp48 = Experience.create!(user_id: m24.id, position: "Developpeur", company: "EDF", sector: "production", industry: "technologie", start_date: "2017-01-18")

# creating experiences for Théo chief sales officier
exp49 = Experience.create!(user_id: m25.id, position: "Chief sales officier", company: "Lynkus", sector: "gestion", industry: "communication", start_date: "2022-01-10")
exp50 = Experience.create!(user_id: m25.id, position: "Developpeur", company: "Webtech", sector: "production", industry: "technologie", start_date: "2017-01-18")

# creating experiences for Emilien business developer
exp51 = Experience.create!(user_id: m26.id, position: "Business developer", company: "Lynkus", sector: "gestion", industry: "communication", start_date: "2022-01-10")
exp52 = Experience.create!(user_id: m26.id, position: "Developpeur", company: "Sony", sector: "production", industry: "jeux vidéos", start_date: "2017-01-18")

# creating experiences for Caroline directrice generale adjointe
exp53 = Experience.create!(user_id: m27.id, position: "Directrice générale adjointe", company: "Boursorama", sector: "direction", industry: "banque", start_date: "2022-01-10")

# creating experiences for Mourad responsable support application
exp54 = Experience.create!(user_id: m28.id, position: "Responsable support", company: "Boursorama", sector: "opérations", industry: "banque", start_date: "2022-01-10")

# creating experiences for Marine controler de gestion
exp55 = Experience.create!(user_id: m29.id, position: "Contrôleur de gestion", company: "Boursorama", sector: "gestion", industry: "banque", start_date: "2022-01-10")

# creating experiences for Tania directrice commercial
exp56 = Experience.create!(user_id: m30.id, position: "Directrice commercial", company: "Satelia", sector: "achats", industry: "environnement", start_date: "2022-01-10")

# creating experiences for Bob pdg chez satelia
exp57 = Experience.create!(user_id: m31.id, position: "PDG", company: "Satelia", sector: "direction", industry: "environnement", start_date: "2022-01-10")

# creating experiences for Ludovic responsable culture et experience
exp58 = Experience.create!(user_id: m32.id, position: "Responsable culture", company: "Satelia", sector: "R&D", industry: "environnement", start_date: "2022-01-10")

# creating experiences for Aurélie infiriere
exp59 = Experience.create!(user_id: m33.id, position: "Infirmière", company: "Satelia", sector: "autre", industry: "médical", start_date: "2022-01-10")

# creating experiences for Sami gestionnaire middle office
exp60 = Experience.create!(user_id: m34.id, position: "Gestionnaire middle office", company: "Alpheys", sector: "gestion", industry: "ingénierie", start_date: "2022-01-10")

# creating experiences for Marie responsable adjointe service produits
exp62 = Experience.create!(user_id: m35.id, position: "Responsable adjointe", company: "Alpheys", sector: "logistique", industry: "ingénierie", start_date: "2022-01-10")

# creating experiences for Jade chargée de gestion
exp63 = Experience.create!(user_id: m36.id, position: "Chargée de gestion", company: "Alpheys", sector: "gestion", industry: "ingénierie", start_date: "2022-01-10")

# creating experiences for Manon responsable communication
exp64 = Experience.create!(user_id: m37.id, position: "Responsable communcation", company: "Square Management", sector: "autre", industry: "communication", start_date: "2022-01-10")

# creating experiences for Clément consultant et chercheur
exp65 = Experience.create!(user_id: m38.id, position: "Consultant et chercheur", company: "Square Management", sector: "R&D", industry: "communication", start_date: "2022-01-10")

# creating experiences for Guillaume directeur des operations
exp66 = Experience.create!(user_id: m39.id, position: "Directeur des opérations", company: "La Solive", sector: "opérations", industry: "culture", start_date: "2022-01-10")

# creating experiences for Maylis cheffe de projet pedagogique
exp67 = Experience.create!(user_id: m40.id, position: "Cheffe de projet pédagogique", company: "La Solive", sector: "gestion", industry: "culture", start_date: "2022-01-10")

# creating experiences for Elias business manager
exp68 = Experience.create!(user_id: m41.id, position: "Business manager", company: "EcoMundo", sector: "achats", industry: "environnement", start_date: "2022-01-10")

# creating experiences for Morgane Gestionnaire des affaires
exp69 = Experience.create!(user_id: m42.id, position: "Gestionnaire des affaires", company: "EcoMundo", sector: "gestion", industry: "environnement", start_date: "2022-01-10")

# creating experiences for Sofia Toxicologue
exp70 = Experience.create!(user_id: m43.id, position: "Toxicologue", company: "EcoMundo", sector: "autre", industry: "environnement", start_date: "2022-01-10")

# creating experiences for Gaby Directeur Sommellerie
exp71 = Experience.create!(user_id: m44.id, position: "Directeur Sommellerie", company: "Le Meurice", sector: "direction", industry: "hôtellerie", start_date: "2022-01-10")

# creating experiences for Rosalie Sous cheffe patiserie
exp72 = Experience.create!(user_id: m45.id, position: "Sous cheffe pâtisserie", company: "Le Meurice", sector: "autre", industry: "hôtellerie", start_date: "2022-01-10")

# creating experiences for Valentine attache de direction experience clients
exp73 = Experience.create!(user_id: m46.id, position: "Attachée de direction", company: "Le Meurice", sector: "direction", industry: "hôtellerie", start_date: "2022-01-10")

# creating experiences for Noemie Responsable optimisation
exp74 = Experience.create!(user_id: m47.id, position: "Responsable optimisation", company: "EDF Store", sector: "achats", industry: "industrie", start_date: "2022-01-10")

# creating experiences for Lucile Responsable communication
exp75 = Experience.create!(user_id: m48.id, position: "Responsable communication", company: "EDF Store", sector: "opérations", industry: "industrie", start_date: "2022-01-10")

# creating experiences for Valentin manager des ventes
exp76 = Experience.create!(user_id: m49.id, position: "Manager des ventes", company: "PP Yarns", sector: "vente", industry: "technologie", start_date: "2022-01-10")

# creating experiences for Chérine responsable evaluation sécurite produits
exp77 = Experience.create!(user_id: m50.id, position: "Responsable évaluation", company: "Puressentiel", sector: "autre", industry: "environnement", start_date: "2022-01-10")


puts "Creating institutions"
i1 = Institution.new(name: "Le Wagon", description: "Accélérez votre carrière, formez-vous aux métiers de la tech")
i2 = Institution.new(name: "Conservatoire national supérieur d'art dramatique", description: "Le Conservatoire National Supérieur d’Art Dramatique – PSL (CNSAD-PSL) est un établissement d’enseignement supérieur placé sous la tutelle du ministère chargé de la culture")
i3 = Institution.new(name: "ESCP Business School", description: "Let's empower and lead the world in the right direction")
i4 = Institution.new(name: "Université Lille 2", description: "Inspirons demain")
i5 = Institution.new(name: "Université Paris-Panthéon-Assas", description: "Pour l'éducation, pour la nation")
i6 = Institution.new(name: "Les compagnons du devoir", description: "Association ouvrière des compagnons du devoir et du tour de France")

# attaching videos to institutions
url1 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'lewagonn.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

i1.video.attach(
  io: URI.open(url1),
  filename: 'lewagon.mp4',
  content_type: 'video/mp4'
)

url2 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'cnad.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

i2.video.attach(
  io: URI.open(url2),
  filename: 'cnad.mp4',
  content_type: 'video/mp4'
)

url3 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'escp.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

i3.video.attach(
  io: URI.open(url3),
  filename: 'escp.mp4',
  content_type: 'video/mp4'
)

url4 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'lille.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

i4.video.attach(
  io: URI.open(url4),
  filename: 'lille.mp4',
  content_type: 'video/mp4'
)

url5 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'assas.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

i5.video.attach(
  io: URI.open(url5),
  filename: 'lille.mp4',
  content_type: 'video/mp4'
)

url6 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'compagnons.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

i6.video.attach(
  io: URI.open(url6),
  filename: 'compagnons.mp4',
  content_type: 'video/mp4'
)

# attaching images to institutions
filei1 = URI.open("https://etudestech.com/wp-content/uploads/2021/07/lewagon-logo-square-b6124eb974be375884558e4464efce48a9b5664f18422768156364363ecdd1fc.png")
i1.photo.attach(io: filei1, filename: "i1.png", content_type: "image/png")
i1.save!

filei2 = URI.open("https://cnsad.psl.eu/wp-content/uploads/2019/12/logo_CNSAD_PSL.svg")
i2.photo.attach(io: filei2, filename: "i2.png", content_type: "image/png")
i2.save!

filei3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/f/fb/ESCP_Business_School_2020_Logo.jpg")
i3.photo.attach(io: filei3, filename: "i3.png", content_type: "image/png")
i3.save!

filei4 = URI.open("https://image.jimcdn.com/app/cms/image/transf/none/path/s591e1c24fa53fcbb/image/i8cbfef27ff5feadc/version/1478359958/image.png")
i4.photo.attach(io: filei4, filename: "i3.png", content_type: "image/png")
i4.save!

filei5 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Logo_Panth%C3%A9on-Assas.svg/1200px-Logo_Panth%C3%A9on-Assas.svg.png")
i5.photo.attach(io: filei5, filename: "i5.png", content_type: "image/png")
i5.save!

filei6 = URI.open("https://www.compagnons-du-devoir.com/sites/all/themes/compagnons/assets/images/logo-compagnons.png")
i6.photo.attach(io: filei6, filename: "i6.png", content_type: "image/png")
i6.save!

puts "Creating educations"
ed1 = Education.create!(user_id: m1.id, institution_id: i1.id, start_date: "2016-10-20", degree_level: "Bootcamp", field: "Développement Web")
ed7 = Education.create!(user_id: m7.id, institution_id: i3.id, start_date: "2010-09-01", degree_level: "Master", field: "Gestion")
ed8 = Education.create!(user_id: m8.id, institution_id: i3.id, start_date: "2016-09-01", degree_level: "Master", field: "Gestion")
ed9 = Education.create!(user_id: m9.id, institution_id: i5.id, start_date: "2016-09-01", degree_level: "Master", field: "Litterature")
ed10 = Education.create!(user_id: m10.id, institution_id: i4.id, start_date: "2014-09-01", degree_level: "License", field: "Gestion")
ed11 = Education.create!(user_id: m11.id, institution_id: i1.id, start_date: "2014-09-01", degree_level: "Bootcamp", field: "Développement Web")
ed12 = Education.create!(user_id: m12.id, institution_id: i3.id, start_date: "2012-09-01", degree_level: "Master", field: "Gestion")
ed13 = Education.create!(user_id: m13.id, institution_id: i3.id, start_date: "2014-09-01", degree_level: "Master", field: "Finance")
ed14 = Education.create!(user_id: m14.id, institution_id: i3.id, start_date: "2014-09-01", degree_level: "Master", field: "Data")
ed15 = Education.create!(user_id: m15.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Master", field: "Environnement")
ed16 = Education.create!(user_id: m16.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Licence", field: "Droit")
ed17 = Education.create!(user_id: m17.id, institution_id: i2.id, start_date: "2009-09-01", degree_level: "Master", field: "Litterature")
ed18 = Education.create!(user_id: m18.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Licence", field: "Commerce")
ed19 = Education.create!(user_id: m19.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Master", field: "Ecologie")
ed20 = Education.create!(user_id: m20.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Finance")
ed21 = Education.create!(user_id: m21.id, institution_id: i2.id, start_date: "2009-09-01", degree_level: "Licence", field: "Finance")
ed22 = Education.create!(user_id: m22.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed23 = Education.create!(user_id: m23.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Master", field: "Commerce")
ed24 = Education.create!(user_id: m24.id, institution_id: i1.id, start_date: "2009-09-01", degree_level: "Bootcamp", field: "Développement Web")

ed25 = Education.create!(user_id: m25.id, institution_id: i1.id, start_date: "2009-09-01", degree_level: "Bootcamp", field: "Développement Web")
ed26 = Education.create!(user_id: m26.id, institution_id: i1.id, start_date: "2009-09-01", degree_level: "Bootcamp", field: "Développement Web")
ed27 = Education.create!(user_id: m27.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Finance")
ed28 = Education.create!(user_id: m28.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Licence", field: "Comptabilité")
ed29 = Education.create!(user_id: m29.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Licence", field: "Droit")
ed30 = Education.create!(user_id: m30.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Master", field: "Commerce")
ed31 = Education.create!(user_id: m31.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Master", field: "Ecologie")
ed32 = Education.create!(user_id: m32.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Doctorat", field: "Environnement")
ed33 = Education.create!(user_id: m33.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Concours", field: "Médecine")
ed34 = Education.create!(user_id: m34.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Master", field: "Gestion")
ed35 = Education.create!(user_id: m35.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed36 = Education.create!(user_id: m36.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed37 = Education.create!(user_id: m37.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Master", field: "Communication")
ed38 = Education.create!(user_id: m38.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Master", field: "Communication")
ed39 = Education.create!(user_id: m39.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "DUT", field: "Litterature")
ed40 = Education.create!(user_id: m40.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Master", field: "Litterature")
ed41 = Education.create!(user_id: m41.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed42 = Education.create!(user_id: m42.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed43 = Education.create!(user_id: m43.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Master", field: "Environnement")
ed44 = Education.create!(user_id: m44.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Master", field: "Hotellerie")
ed45 = Education.create!(user_id: m45.id, institution_id: i4.id, start_date: "2009-09-01", degree_level: "Licence", field: "Hotellerie")
ed46 = Education.create!(user_id: m46.id, institution_id: i5.id, start_date: "2009-09-01", degree_level: "Master", field: "Hotellerie")
ed47 = Education.create!(user_id: m47.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed48 = Education.create!(user_id: m48.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed49 = Education.create!(user_id: m49.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")
ed50 = Education.create!(user_id: m50.id, institution_id: i3.id, start_date: "2009-09-01", degree_level: "Master", field: "Data")

puts "Creating contents"
c1 = Content.new(user_id: m1.id, title: "Sophie - Lead software engineer")
c7 = Content.new(user_id: m7.id, title: "Océane - Chef de projet digital chez Colorz")
c8 = Content.new(user_id: m8.id, title: "Hélène - Data analyst senior chez Cenisis")
c9 = Content.new(user_id: m9.id, title: "Jean - Business developper chez Mirakl")
c10 = Content.new(user_id: m10.id, title: "Pascal - Chef de chantier chez Sferis")
c11 = Content.new(user_id: m11.id, title: "Christophe - Senior product manager ches Gens de Confiance")
c12 = Content.new(user_id: m12.id, title: "Mihaela - Senior account executive chez Odaseva")
c13 = Content.new(user_id: m13.id, title: "Camille - Actuaire chez Crédit Agricole Assurances")
c14 = Content.new(user_id: m14.id, title: "Fatima - Data analyste chez Kapten")
c15 = Content.new(user_id: m15.id, title: "Maëlis - PDG chez Binhappy")


# attaching videos to content
url_c1 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'sophie-lead.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c1.video.attach(
  io: URI.open(url_c1),
  filename: 'sophie-lead.mp4',
  content_type: 'video/mp4'
)
c1.save!

url_c7 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'oceane-chef.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c7.video.attach(
  io: URI.open(url_c7),
  filename: 'oceane-chef.mp4',
  content_type: 'video/mp4'
)
c7.save!

url_c8 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'helene-data.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c8.video.attach(
  io: URI.open(url_c8),
  filename: 'helene-data.mp4',
  content_type: 'video/mp4'
)
c8.save!

url_c9 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'jean-business.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c9.video.attach(
  io: URI.open(url_c9),
  filename: 'jean-business.mp4',
  content_type: 'video/mp4'
)
c9.save!

url_c10 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'pascal-chef.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c10.video.attach(
  io: URI.open(url_c10),
  filename: 'pascal-chef.mp4',
  content_type: 'video/mp4'
)
c10.save!

url_c11 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'christophe-senior.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c11.video.attach(
  io: URI.open(url_c11),
  filename: 'christophe-seniorpm.mp4',
  content_type: 'video/mp4'
)
c11.save!

url_c12 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: 'mihaela-senior.mp4',
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c12.video.attach(
  io: URI.open(url_c12),
  filename: 'mihaela-senior.mp4',
  content_type: 'video/mp4'
)
c12.save!

url_c13 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: "camille-actuaire.mp4",
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c13.video.attach(
  io: URI.open(url_c13),
  filename: "camille-actuaire.mp4",
  content_type: 'video/mp4'
)
c13.save!

url_c14 = Aws::S3::Object.new(
  bucket_name: ENV['AWS_BUCKET'],
  key: "fatima-data.mp4",
  client: Aws::S3::Client.new(
    access_key_id: ENV['ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )
).presigned_url(:get, expires_in: 604_800)

c14.video.attach(
  io: URI.open(url_c14),
  filename: "fatima-data.mp4",
  content_type: 'video/mp4'
)
c14.save!

tags_name = ["Aéronautique", "Agro", "Artisanat", "Audiovisuel", "Finance", "Automobile", "Banque", "Assurance", "BTP", "Biologie-chimie", "Commerce", "Communication", "Art", "Culture", "Défense", "Droit", "Edition", "Enseignement", "Environnement", "Administration", "Hôtellerie-Restauration", "Humanitaire", "Immobilier", "Industrie", "Informatique", "Journalisme", "Luxe", "Marketing", "Médical", "Mode-Textile", "Paramédical", "Social", "Sport", "Tourisme", "Transport-Logistique", "Technologie", "Médecine", "Autre", "R&D", "RH", "Production", "Marketing", "Achats", "Comptabilité", "Direction", "Gestion", "Logistique", "Vente", "Opérations", "Manutention", "Création", "Entretien", "Ingénierie", "Entrepreneur"]

puts "Creating tags"
counter = 0
tags_name.each do |tag_name|
  counter += 1

  t = Tag.create!(name: tag_name.downcase)
  User.student.sample(3).each do |student|
    Preference.create!(user: student, tag: t)
  end
end

# t1 = Tag.create!(name: "transport")
# t2 = Tag.create!(name: "restauration")
# t3 = Tag.create!(name: "publique")
# t4 = Tag.create!(name: "artisanat")
# t5 = Tag.create!(name: "musique")
# t6 = Tag.create!(name: "cinema")
# t7 = Tag.create!(name: "santé")
# t8 = Tag.create!(name: "pharma")
# t9 = Tag.create!(name: "juridique")
# t10 = Tag.create!(name: "immobilier")
# t11 = Tag.create!(name: "services")
# t12 = Tag.create!(name: "finance")
# t13 = Tag.create!(name: "gestion")
# t14 = Tag.create!(name: "entrepreneur")
# t15 = Tag.create!(name: "vente")
# t16 = Tag.create!(name: "commerce")
# t17 = Tag.create!(name: "hotellerie")
# t18 = Tag.create!(name: "construction")
# t19 = Tag.create!(name: "batiment")
# t20 = Tag.create!(name: "grande consommation")
# t21 = Tag.create!(name: "marketing")
# t22 = Tag.create!(name: "luxe")
# t23 = Tag.create!(name: "evenementiel")
# t24 = Tag.create!(name: "web")
# t25 = Tag.create!(name: "photo")

# puts "Creating preferences"
# p1 = Preference.create!(user: s1, tag_id: t22.id)
# p2 = Preference.create!(user_id: s1.id, tag_id: t17.id)
# p3 = Preference.create!(user_id: s1.id, tag_id: t23.id)
# p4 = Preference.create!(user_id: s2.id, tag_id: t16.id)
# p5 = Preference.create!(user_id: s2.id, tag_id: t12.id)
# p6 = Preference.create!(user_id: s3.id, tag_id: t9.id)
# p7 = Preference.create!(user_id: s3.id, tag_id: t3.id)
# p8 = Preference.create!(user_id: s4.id, tag_id: t24.id)
# p9 = Preference.create!(user_id: s4.id, tag_id: t14.id)
# p10 = Preference.create!(user_id: s5.id, tag_id: t23.id)
# p11 = Preference.create!(user_id: s5.id, tag_id: t14.id)
# p12 = Preference.create!(user_id: s5.id, tag_id: t12.id)
# p13 = Preference.create!(user_id: s6.id, tag_id: t4.id)
# p14 = Preference.create!(user_id: s7.id, tag_id: t5.id)
# p15 = Preference.create!(user_id: s7.id, tag_id: t4.id)
# p16 = Preference.create!(user_id: s8.id, tag_id: t3.id)
# p17 = Preference.create!(user_id: s9.id, tag_id: t21.id)
# p18 = Preference.create!(user_id: s9.id, tag_id: t20.id)
# p19 = Preference.create!(user_id: s10.id, tag_id: t18.id)
