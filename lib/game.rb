require_relative 'board'
require_relative 'player'

class Game

    attr_accessor :board, :player1, :player2

        def initialize
            
            @players = []

            puts "Joueur 1, comment tu t'appelles ?"
            
            player_name = gets.chomp
            @player1 = Player.new(player_name, "X")
            @players << @player1
            @player1.value = "X"
            @current_player = @player1
            puts "Joueur 2, comment tu t'appelles ?"

            player_name = gets.chomp
            @player2 = Player.new(player_name, "O")
            @players << @player2
            @player2.value = "O"
            
            puts "Bienvenue " + player1.name + " et " + player2.name + " ! "

            puts player1.name + " jouera avec les " + player1.value + " et " + player2.name + " jouera avec les " + player2.value + "."
            
            @board = Board.new
            
        end
    
        def switch_player
            if @current_player == @player1
               @current_player = @player2
            else
              @current_player = @player1
            end
          end
        
          def turn
              9.times do 
                if @board.victory? == false
                puts @board.display_board
                @board.play_turn(@current_player)
                switch_player
                else
                  break
                end
                puts @board.display_board
            end
                if @board.victory? == true
                    switch_player
                    puts "#{@current_player.name} gagne !"
                        else
                        puts "EGALITE"
                    end
                end
            
    

            def again
            puts "Écris 'oui' si tu veux rejouer"
            new_game = gets.chomp.to_s
            if new_game == "oui"
                game = Game.new
                game.turn
                game.again
                
            else 
                puts "tant pis !"
            end
        end
    end

    