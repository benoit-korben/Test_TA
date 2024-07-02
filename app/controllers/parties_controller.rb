class PartiesController < ApplicationController

  def index
    @party = Party.new
    @letters = create_ten_letters_list
  end

  def create
    @party = Party.new(party_params)
    @game = Game.new(user: current_user)
    @game.save
    @party.games_id = @game.id
    @party.save
    redirect_to party_path(@party)
  end

  def show
    @party = Party.find(params[:id])
  end

  def create_ten_letters_list
    #five voyels and five consonants
    voyels = %w(a e i o u)
    consonants = %w(b c d f g h j k l m n p q r s t v w x y z)
    letters = []
    5.times do
      letters << voyels.sample
      letters << consonants.sample
    end
    letters.shuffle
  end

  def party_params
    params.require(:party).permit(:word, :ten_letters_list)
  end
end
