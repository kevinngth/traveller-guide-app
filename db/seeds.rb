# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{name: 'Art and culture'},{name: 'Entertainment'},{name: 'Food and drink'},{name: 'Nature and outdoors'},{name: 'Sports'},{name: 'Health and wellness'},{name: 'Shopping'}])



# guides = Guide.create([{user_id:2,active:true,bio:'no'},{user_id:3,active:true,bio:'nono'},{user_id:4,active:true,bio:'nonono'},{user_id:5,active:true,bio:'no'}])


# experiences = Experience.create([{category_id:2,title:"skydiving",description:"jump off a plane", guide_id:1},{category_id:5,title:"rock climb",description:"jump off a plane", guide_id:2},{category_id:3,title:"drink",description:"driiiiiiink", guide_id:5}])