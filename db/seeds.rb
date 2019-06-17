# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all
User.destroy_all
#TodoUsers.destroy_all

#creamos 6 usuarios en memoria
#6.times do |i|
#    User.create({
#        email:"email_#{i+1}@desafio.cl" ,
#        password:"password"
#    })
#end
# creamos 9 tareas anidando 4 usuarios aleatorios  con el RANDOM a cada tarea, first selecciona el primero
9.times do |i|
    t = Todo.create({
        name: "Tarea #{i+1}",
        description: "Descripción #{i+1}",
        photo: "https://picsum.photos/id/#{i+10}/500/500/"
    })
    # 4.times do |i|
    #     t.users << User.order('RANDOM()').first
    # end
    #t.save
end