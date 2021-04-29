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
            if @current_player == @user_01
               @current_player = @user_02
            else
              @current_player = @user_01
            end
          end
        
          def turn
              9.times do 
                if @board.victory? == false
                puts @board.display
                @board.play_turn(@current_player)
                switch_player
                else
                  break
                end
        
                puts @board.display
        
                if @board.victory? == true
                switch_player
                puts "#{@current_player.name} gagne !"
                else
                puts "EGALITE"
                end
              end
          end
        end