# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

@users        = []
@cities       = []
@potins       = []
@messages      = []
@comments      = []

def clean_database
  puts " Etape 0 : Suppression des anciennes données."    
  User.delete_all
  City.delete_all 
  Potin.delete_all  
  PrivateMessage.delete_all
  Comment.delete_all  
  Like.delete_all    
end 


def create_user(number)
  puts " Etape 1 : Création de #{number} utilisateurs."    

    number.times do
    
        @users << User.create(first_name: Faker::Science.scientist,last_name: Faker::Company.name, email: Faker::Internet.email,age: Faker::Number.between(18, 85),city:@cities[Random.new.rand(0..@cities.size-1)], description: Faker::Lorem.sentence(3) )     
    end
end

def create_city(number)
  puts " Etape 1 : Création de #{number} villes."    

    number.times do
    
        @cities << City.create(name: Faker::Address.city,postal_code: Faker::Address.zip)
  
        
    end
end

def create_potin(number)
    puts " Etape 2 : Création de #{number} potins."    

    number.times do

        @potins << Potin.create(title: Faker::Lorem.sentence(3, true, 4), content:Faker::Lorem.paragraph(2), user:@users[Random.new.rand(0..@users.size-1)],date:Faker::Time.between(DateTime.now - 1, DateTime.now))
   
    end    
end


def create_private_message(number)
    puts " Etape 3 : Création de #{number} messages privés."    

    number.times do

        @messages << PrivateMessage.create(content:Faker::Lorem.paragraph(2), sender:@users[Random.new.rand(0..@users.size-1)],recipient:@users[Random.new.rand(0..@users.size-1)],date:Faker::Time.between(DateTime.now - 1, DateTime.now))
   
    end    
end


def create_comment(number)
    puts " \nEtape 4 : Création de #{number} commentaires."    

    number.times do

        user = @users[Random.new.rand(0..@users.size-1)]
        
        if (Random.new.rand(0..1) % 2 == 0) && @comments.size > 0
          comment = @comments[Random.new.rand(0..@comments.size-1)]
          @comments << Comment.create(content:Faker::Lorem.paragraph(2), user: user, commented: comment)
          puts "  #{user.first_name} a ajouter un commentaire au commentaire suivant << #{comment.content} >>"
        else    
          potin = @potins[Random.new.rand(0..@potins.size-1)]
          @comments << Comment.create(content:Faker::Lorem.paragraph(2), user: user,commented: potin)
          puts "  #{user.first_name} a ajouter un commentaire au potin suivant << #{potin.title}. >>"   
        end 
   
    end    
end


def create_like(number)
    puts " \nEtape 5 : Création de #{number} likes."    

    number.times do
        user  = @users[Random.new.rand(0..@users.size-1)]
        
        if Random.new.rand(0..1) % 2 == 0
          potin = @potins[Random.new.rand(0..@potins.size-1)]
          Like.create(user: user, imageable: potin)
          puts " #{user.first_name} a mit un like au potin suivant << #{potin.title}. >>"    
        else    
          comment = @comments[Random.new.rand(0..@comments.size-1)]
          Like.create(user: user, imageable: comment)
          puts " #{user.first_name} a mit un like au commentaire suivant << #{comment.content} >>"    
        end    
    end     
end

def create_tag(number)
   puts " \nEtape 6 : Création de #{number} tags."

   number.times do
      tag = Tag.create(title: Faker::Team.name)

   end
    
end


puts "-------------------------- *** ---------------------------------"
puts "Bonjour, nous allons créer un jeu de test pour tester nos Models"
clean_database
create_city(10)
create_user(10)
create_potin(20)
create_private_message(1)
create_comment(20)
create_like(20)
create_tag(5)
puts "-------------------------- FIN ---------------------------------"


    

