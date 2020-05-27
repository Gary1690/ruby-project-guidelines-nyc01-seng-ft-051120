class Menu

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
        display_menu
        option = gets.chomp.to_i
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
            # break
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

    end

    def explore_actor

    end

    def explore_rating

    end

    def add_watchlist

    end

    def remove_watchlist

    end

    def write_review

    end

    def play

    end

    def exit

    end



    
   
end