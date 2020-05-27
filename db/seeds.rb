User.delete_all 
Show.delete_all 
Watchlist.delete_all
Actor.delete_all 

john = User.create(first_name:"John",last_name:"Walker",email:"JohnWalker@aol.com",password:"hewalks")



ozark = Show.create(title:"ozark")
fwd = Show.create(title:"Fear the Walking Dead")

Watchlist.create(user:john,show:ozark)
Watchlist.create(user:john,show:fwd)



actor = Actor.create(name:"Jason Bateman")

Starring.create(actor:actor,show:ozark)