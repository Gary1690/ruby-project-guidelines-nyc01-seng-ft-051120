class Menu

    attr_accessor :continue
    @@current_user = nil

    def initialize
        @continue = true
    end


    def greeting
        option =""
        while option != 'q' && option != 'Q'
            puts "Welcome to Flixnet"
            puts  "1. Sign in"
            puts  "2. Sign up"
            puts  "Press q or Q to quit"
            option = gets.chomp
            if option == '1'
                system ("clear") 
                sign_in
                break
            elsif option == '2'
                system ("clear") 
                sign_up
                break
            end
        end
    end

    def sign_in
        attempts = 0
        while attempts < 3 do  
            puts "Sign in".center(20)
            print "Email: "
            user_name = gets.chomp
            print "Password: "
            pass = gets.chomp
            user = User.find_by(email: user_name, password: pass)
            if user
                system("clear")
                puts "Welcome #{user.first_name}!"
                @@current_user = user
                main_menu
                break
            else
                attempts+=1
                puts "Incorrect Login. Attempts(#{attempts}/3)"
            end
        end
    end

    def sign_up
        puts "Sign up"
        print "First Name: "
        first_name = gets.strip
        print "Last Name: "
        last_name = gets.strip 
        print "Email: "
        email = gets.strip 
        print "Password: "
        pass = gets.strip
        new_user = User.create(first_name:first_name,last_name:last_name,email:email,password:pass)
        @@current_user = new_user
        system("clear")
        puts "Welcome #{new_user.first_name}!"
        main_menu 
    end


    def display_menu
        puts "1. Explore all Shows"
        puts "2. Explore by Genre"
        puts "3. Explore by Actor"
        puts "4. Explore by Rating"
        puts "5. Add to Watchlist"
        puts "6. Remove From Watchlist"
        puts "7. Write a Review"
        puts "8. Play"
        puts "9. Exit"
    end

    def main_menu
       while self.continue do 
            display_menu
            print "Enter Option Number (1-9): "
            option = gets.chomp.to_i
            options(option)
            if @continue
                pause
            end
       end
    end

    def pause 
        print "press any key"                                                                                                    
        STDIN.getch                                                                                                              
        print "            \r"                                                                                                      
    end

    def options(option)
        case option 
        when 1 
            explore_shows
        when 2
            explore_genre
        when 3
            explore_actor
        when 4
            explore_rating
        when 5
            add_watchlist
        when 6
            remove_watchlist
        when 7
            write_review
        when 8
            play
        when 9
            exit
            self.continue= false
        else
            puts "That's not an Option"
        end
    end

    def display_shows(shows)
        shows.map do |show|
            60.times{print"-"}
            #puts "\n title: #{show.title} genre:#{show.genre} rating:#{show.rating}"
            printf "\n%-30s %-20s %-10s\n",show.title,show.genre,show.rating
            puts " "
        end
    end

    def explore_shows
        puts "Shows".center(60)
        display_shows(Show.all)
    end

    def explore_genre
        puts "Genre Catalog".center(60)
        puts "-" * 60
        Show.genres.map do |genres|
            puts genres
        end
        print "Select Genre: "
        genre = gets.chomp
        puts "#{genre} Shows".center(60)
        display_shows(Show.where(genre: genre))
    end

    def explore_actor
        print "Select Actor: "
        actor = gets.chomp
        puts "Shows starring #{actor}".center(60)
        display_shows(Actor.find_by(name: actor).shows)
    end

    def explore_rating
        puts "Shows by rating".center(60)
        display_shows(Show.all.sort_by{|x| x.rating}.reverse)
    end

    def add_watchlist
        display_watchlist
        print "Add Show to Watchlist: "
        add_show = gets.chomp

        show = Show.find_by(title: add_show)
        if show 
            Watchlist.create(show: show, user: @@current_user)
            @@current_user.reload
            puts "Show Added!"
        else
            puts "Show Not Found"
        end
    end

    def display_watchlist
        puts "Shows in your Watchlist".center(60)
        display_shows(@@current_user.shows)
    end

    def remove_watchlist
        display_watchlist
        print "Remove Show from Watchlist: "
        add_show = gets.chomp

        show = Show.find_by(title: add_show)
        if show 
            watchlist = Watchlist.find_by(show: show, user: @@current_user)
            Watchlist.delete(watchlist)
            @@current_user.reload
            puts "Show Removed!"
        else
            puts "Show Not Found"
        end
    end

    def write_review
        puts "Review".center(60)
        puts "-" * 60
        print "Show: "
        title = gets.chomp

        show = Show.find_by(title: title)
            if show
                print "Comment: "
                comment = gets.chomp
                print "Rating (1 to 5): "
                rating = gets.chomp.to_i
                Review.create(comment: comment, rating: rating, show: show, user: @@current_user)
                puts "Review Created"
            else
                puts "Show Not Found"
            end

    end

    def play
        puts "Shows in your Watchlist".center(60)
        display_shows(@@current_user.shows)

        print "Play Show from Watchlist: "
        title = gets.chomp

        show = Show.find_by(title: title)
        if show && @@current_user.shows.include?(show)
            puts "Now Playing, #{show.title}"
        else
            puts "#{show.title} Not Found in Watchlist"
        end
    end

    def exit
        puts "Goodbye"
    end
   
end