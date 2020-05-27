class Menu

    attr_accessor :continue

    def initialize
        @continue = true
    end


    def greeting
        puts "Welcome to Flixnet"
        print "User name: "
        user_name = gets.chomp
        print "Password: "
        pass = gets.chomp
        user = User.find_by(email: user_name, password: pass)
        if user
            puts "Welcome #{user.first_name}!"
            @@current_user = user
            main_menu
        else
            puts "Incorrect Login."
        end
    end

    @@current_user = nil

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
        option = gets.chomp.to_i
        options(option)
       end
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

    def explore_shows
        Show.all.map do |show|
            puts "#{show.title} #{show.rating}"
            puts " "
        end
    end

    def explore_genre
        Show.genres.map do |genres|
            puts genres
        end
        print "Select Genre: "
        genre = gets.chomp

        Show.where(genre: genre).map do |show|
            puts "#{show.title} #{show.rating}"
            puts " "
        end
    end

    def explore_actor
        print "Select Actor: "
        actor = gets.chomp

        Actor.find_by(name: actor).shows.map do |show|
            puts "#{show.title} #{show.rating}"
            puts " "
        end

    end

    def explore_rating

    end

    def add_watchlist
        print "Add Show to Watchlist: "
        add_show = gets.chomp

        show = Show.find_by(title: add_show)
        if show 
            Watchlist.create(show: show, user: @@current_user)
            print "Show Added!"
        else
            print "Show Not Found"
        end
    end

    def remove_watchlist
        @@current_user.shows.map do |show|
            puts "#{show.title}"
            puts " "
        end

        print "Remove Show from Watchlist: "
        add_show = gets.chomp

        show = Show.find_by(title: add_show)
        if show 
            watchlist = Watchlist.find_by(show: show, user: @@current_user)
            Watchlist.delete(watchlist)
            print "Show Removed!"
        else
            print "Show Not Found"
        end
    end

    def write_review
        print "Show: "
        title = gets.chomp

        show = Show.find_by(title: title)
            if show
                puts "Comment: "
                comment = gets.chomp
                puts "Rating (1 to 5): "
                rating = gets.chomp.to_i
                Review.create(comment: comment, rating: rating, show: show, user: @@current_user)
                puts "Review Created"
            else
                puts "Show Not Found"
            end

    end

    def play
        @@current_user.shows.map do |show|
            puts "#{show.title}"
            puts " "
        end

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