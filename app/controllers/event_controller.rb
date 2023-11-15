class EventController < ApplicationController
    def create
      @events = Event.new(event_params)

      @events.user = current_user
      if @events.save
        flash[:success] = "L'évènement a été créé avec succès"
        redirect_to event_index_path
      else
        flash[:alert] = @events.errors.full_messages.to_sentence
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

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find(params[:id])
      end

      def event_params
        params.require(:event).permit(:started_date, :duration, :title, :description, :price, :location, :user_id)
      end

      def destroy
        @event.destroy!
      end
        
end
