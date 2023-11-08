class AttendanceController < ApplicationController
    def create
        @attendances = Attendance.new(stripe_customer_id: params[:stripe_customer_id])
                    
        # @events.user_id = current_user.id

            if @attendances.save
            flash[:success] = "Tu es bien inscrit à l'évènement !"
            redirect_to event_index_path
            else
            flash[:alert] = "Une erreur s'est glissée, essaye à nouveau!"
            redirect_to new_attendance_path
            end 
    end

    def new
    end
end
