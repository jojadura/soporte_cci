# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin

    Role.find_or_create_by(:name=>"Administrador")
    puts "Se creo Role Administrador"
    Role.find_or_create_by(:name=>"Director")
    puts "Se creo Role  Director de Area"
    Role.find_or_create_by(:name=>"Usuario")
    puts "Se creo Role Usuario"
    User.create!({
        :email=>'admin@gmmail.com',
        :password=> 'changeme',
        :sign_in_count=>0,
        :encrypted_password=> User.new(:password => 'changeme').encrypted_password,
        :name=> 'Administrador',
        :role_id => Role.admin.id,
        :created_at=> Time.now.strftime("%Y-%m-%d"),
        :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })
    puts "se creo el usuario ADMINISTRADOR" 
    puts ">>>>>>>>>>   USER:  admin@gmail.com"
    puts ">>>>>>>>>PASSWORD:  changeme"

    State.find_or_create_by(:name=>"Abierto",:color=>"#e31919")
     puts "Se creo State Abierto"
    
    State.find_or_create_by(:name=>"Pendiente",:color=>"#f9f822")
     puts "Se creo State Pendiente"
    
    State.find_or_create_by(:name=>"Pre-finalizado",:color=>"#1148cc")
     puts "Se creo State Pre-finalizado"
    
    State.find_or_create_by(:name=>"Finalizado",:color=>"#20c807")
     puts "Se creo State Finalizado"


    User.create!({
        :email=>'prosoporte@ccibague.org',
        :password=> '123456',
        :sign_in_count=>0,
        :encrypted_password=> User.new(:password => '123456').encrypted_password,
        :name=> 'John Jairo Dussán',
        :direction_id => '3',
        :role_id => '1',
        :created_at=> Time.now.strftime("%Y-%m-%d"),
        :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })

        Direction.create!({
            :name=>'Dirección Jurídica',
            :user_id => '3',
            :created_at=> Time.now.strftime("%Y-%m-%d"),
            :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })

        Direction.create!({
            :name=>'Dirección Competitividad e Innovación',
            :user_id => '3',
            :created_at=> Time.now.strftime("%Y-%m-%d"),
            :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })

        Direction.create!({
            :name=>'Dirección Comercial y Mercadeo',
            :user_id => '3',
            :created_at=> Time.now.strftime("%Y-%m-%d"),
            :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })

        Direction.create!({
            :name=>'Dirección Administrativa y Financiera',
            :user_id => '3',
            :created_at=> Time.now.strftime("%Y-%m-%d"),
            :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })

        Direction.create!({
            :name=>'Dirección Investigaciones y Publicidad',
            :user_id => '3',
            :created_at=> Time.now.strftime("%Y-%m-%d"),
            :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })

=end
    State.find_or_create_by(:name=>"Abierto",:color=>"#e31919",:user_id=>"1",:order=>"1")
     puts "Se creo State Abierto"
    
    State.find_or_create_by(:name=>"Pendiente",:color=>"#f9f822",:user_id=>"1",:order=>"2")
     puts "Se creo State Pendiente"
    
    State.find_or_create_by(:name=>"Pre-finalizado",:color=>"#1148cc",:user_id=>"1",:order=>"3")
     puts "Se creo State Pre-finalizado"
    
    State.find_or_create_by(:name=>"Finalizado",:color=>"#20c807",:user_id=>"1",:order=>"4")
     puts "Se creo State Finalizado"
