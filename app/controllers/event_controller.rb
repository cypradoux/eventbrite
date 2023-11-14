class EventController < ApplicationController
    def create
      

        @events = Event.new(title: params[:title],
                          description: params[:description],
                          location: params[:location],
                          started_date: params[:started_date],
                          price: params[:price],
                          duration: params[:duration])

      @events.user = current_user
      if @events.save
        flash[:success] = "L'évènement a été créé avec succès"
        redirect_to event_index_path
      else
        flash[:alert] = "Il manque des renseignements pour que tu puisses créer un évènement !"
        redirect_to new_event_path
      end 
    end

    def new

    end

    def index
        @events = Event.all
    end

    def show
        index = params[:id].to_i
    @element = Event.all[index - 1]
    @event = Event.find(params[:id])
    # @event = Event.find(params[:id])
    # @user = @event.user # Récupère l'utilisateur qui a créé l'événement
    # @user_email = @user.email
    end
end
