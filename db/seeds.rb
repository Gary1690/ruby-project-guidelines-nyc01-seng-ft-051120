User.delete_all 
Show.delete_all 
Watchlist.delete_all
Actor.delete_all 
Review.delete_all
Starring.delete_all

john = User.create(first_name:"John",last_name:"Walker",email:"JohnWalker@aol.com",password:"hewalks")



ozark = Show.create(title:"ozark", genre:"Crime")
fwd = Show.create(title:"Fear the Walking Dead", genre:"Science Ficition")
arrested = Show.create(title:"Arrested Development", genre:"Comedy")

Watchlist.create(user:john,show:ozark)
Watchlist.create(user:john,show:fwd)



actor = Actor.create(name:"Jason Bateman")

Starring.create(actor:actor,show:ozark)
Starring.create(actor:actor,show:arrested)


review1 = Review.create(comment:"Good show",rating:5, user: john, show: ozark)