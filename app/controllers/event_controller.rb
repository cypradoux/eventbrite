class EventController < ApplicationController
    def create
        @events = Event.new(title: params[:title],
                          description: params[:description],
                          location: params[:location],
                          started_date: params[:started_date],
                          price: params[:price],
                          duration: params[:duration])

    # @events.user = User.find_by(id: session[:user_id])

      if @events.save
        flash[:success] = "L'évènement a été créé avec succès"
        redirect_to event_index_path
      else
        flash[:alert] = "Il manque des renseignements pour que tu puisses créer un évènement !"
        redirect_to new_event_path
      end 
    end

    def index
        @events = Event.all
    end

    def show
        index = params[:id].to_i
    @element = Event.all[index - 1]

    end
end
