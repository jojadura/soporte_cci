# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Direction.create!({
    :name=>'Dirección Jurídica',
    :created_at=> Time.now.strftime("%Y-%m-%d"),
    :updated_at=> Time.now.strftime("%Y-%m-%d"),
 })

Direction.create!({
    :name=>'Dirección Competitividad e Innovación',
    :created_at=> Time.now.strftime("%Y-%m-%d"),
    :updated_at=> Time.now.strftime("%Y-%m-%d"),
 })

Direction.create!({
    :name=>'Dirección Comercial y Mercadeo',
    :created_at=> Time.now.strftime("%Y-%m-%d"),
    :updated_at=> Time.now.strftime("%Y-%m-%d"),
 })

Direction.create!({
    :name=>'Dirección Administrativa y Financiera',
    :created_at=> Time.now.strftime("%Y-%m-%d"),
    :updated_at=> Time.now.strftime("%Y-%m-%d"),
 })

Direction.create!({
    :name=>'Dirección Investigaciones y Publicidad',
    :created_at=> Time.now.strftime("%Y-%m-%d"),
    :updated_at=> Time.now.strftime("%Y-%m-%d"),
 })
