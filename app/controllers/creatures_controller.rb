class CreaturesController < ApplicationController

	def index
		@creatures = Creature.all #finding all in the DB
	end

	def new
		render :new	
	end

	def create
            @creature = Creature.new(params.require(:creature).permit(:name, :description) )           
            @creature.save

            redirect_to  @creature
        end


	def show
            creature_id = params[:id]
            @creature = Creature.find(creature_id)
            render :show
        end

      def edit
      	creature_id = params[:id]
      	@creature = Creature.find(creature_id)
      end

      def update
      	creature_id = params[:id]
      	@creature = Creature.find(creature_id)
      	creature_params = params.require(:creature).permit(:name, :description)
      	@creature.update_attributes(creature_params)
      	render :show
      end

      def destroy
      	creature_id = params[:id]
      	creature = Creature.find(creature_id)
      	creature.destroy

      	redirect_to creatures_path
      end


end