User.delete_all 
Show.delete_all 
Watchlist.delete_all
Actor.delete_all 
Review.delete_all
Starring.delete_all

john = User.create(first_name:"John",last_name:"Walker",email:"JohnWalker@aol.com",password:"hewalks")
chris = User.create(first_name:"Chris",last_name:"Hosler",email:"Chris.Hosler@gmail.com",password:"12345")
gary = User.create(first_name:"Gary",last_name:"Cordero",email:"Gary.Cordero@gmail.com",password:"pwd123")



ozark = Show.create(title:"ozark", genre:"Crime")
fwd = Show.create(title:"Fear the Walking Dead", genre:"Science Fiction")
arrested = Show.create(title:"Arrested Development", genre:"Comedy")
the_flash = Show.create(title:"The Flash",genre:"Super Heroes")
green_arrow = Show.create(title:"Green Arrow",genre:"Super Heroes")
batwoman = Show.create(title:"Batwoman",genre:"Super Heroes")
the_office = Show.create(title:"The Office",genre:"Comedy")
parks_and_recreation = Show.create(title:"Parks and Recreation",genre:"Comedy")
the_stranger_thing = Show.create(title:"The Stranger Thing",genre:"Science Fiction")
good_girls = Show.create(title:"Good Girls",genre:"Crime")
breaking_bad = Show.create(title:"Breaking Bad",genre:"Crime")

Watchlist.create(user:john,show:ozark)
Watchlist.create(user:john,show:fwd)
Watchlist.create(user:john,show:good_girls)
Watchlist.create(user:gary,show:breaking_bad)
Watchlist.create(user:gary,show:good_girls)
Watchlist.create(user:gary,show:ozark)
Watchlist.create(user:gary,show:parks_and_recreation)
Watchlist.create(user:chris,show:the_office)
Watchlist.create(user:chris,show:parks_and_recreation)
Watchlist.create(user:chris,show:batwoman)
Watchlist.create(user:chris,show:the_flash)
Watchlist.create(user:chris,show:the_stranger_thing)




actor = Actor.create(name:"Jason Bateman")
grant_gusting = Actor.create(name:"Grant Gustin")
danielle_panabaker = Actor.create(name:"Danielle Panabaker")
steve_carell = Actor.create(name:"Steve Carell")
alycia_debnam = Actor.create(name:"Alycia Debnam")
stephen_amell  = Actor.create(name:"Stephen Amell")
david_ramsey = Actor.create(name:"David Ramsey")
ruby_rose = Actor.create(name:"Ruby Rose")
amy_poehler = Actor.create(name:"Amy Poehler")
chris_pratt = Actor.create(name:"Chris Pratt")
finn_wolfhard = Actor.create(name:"Finn Wolfhard")
manny_montana = Actor.create(name:"Manny Montana")
bryan_cranston = Actor.create(name:"Bryan Cranston")


Starring.create(actor:actor,show:ozark)
Starring.create(actor:actor,show:arrested)
Starring.create(actor:grant_gusting,show:the_flash)
Starring.create(actor:danielle_panabaker,show:the_flash)
Starring.create(actor:steve_carell,show:the_office)
Starring.create(actor:alycia_debnam,show:fwd)
Starring.create(actor:stephen_amell,show:green_arrow)
Starring.create(actor:david_ramsey,show:green_arrow)
Starring.create(actor:ruby_rose,show:batwoman)
Starring.create(actor:amy_poehler,show:parks_and_recreation)
Starring.create(actor:chris_pratt,show:parks_and_recreation)
Starring.create(actor:finn_wolfhard,show:the_stranger_thing)
Starring.create(actor:manny_montana,show:good_girls)
Starring.create(actor:bryan_cranston,show:breaking_bad)







review1 = Review.create(comment:"Good show",rating:5, user: john, show: ozark)