class OpinionsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", only: [:destroy]
 def create
   @film = Film.find(params[:film_id])
   @opinion = Opinion.new(film_id: @film.id)
   @opinion.attributes = opinion_params

   if @opinion.save
     redirect_to film_path(@film)
   else
     render "films/show"
   end
 end

 def destroy
   opinion = Opinion.find(params[:id])
   opinion.destroy

   redirect_to film_path(opinion.film)
 end

 private

 def opinion_params
    params.require(:opinion).permit(:name, :surname, :rate, :text)
 end
end
