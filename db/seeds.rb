# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!([
  { nome: "Eglom", email: "eglomsostenes@gmail.com", password: "dibre123", admin: true },
  { nome: "Teste", email: "teste@gmail.com", password: "dibre123", admin: false },
])

Enquete.create!([
  { titulo: "Eleição para prefeito", descricao: "Se a eleição para prefeito fosse hoje, em quem você votaria?" },
])
