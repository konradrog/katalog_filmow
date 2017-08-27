class FilmsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def index
    @films = Film.all.order(:title)
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.create(film_params)

    if @film.new_record?
      render "new"
    else
      redirect_to film_path(@film)
    end
  end

  def show
    @film = Film.find(params[:id])
    @opinion = Opinion.new(film_id: @film.id)
    @next_film = @film.next_film
    @previous_film = @film.previous_film

  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])

    if @film.update(film_params)
      redirect_to @film
    else
      render "edit"
    end
  end

  def destroy
    film = Film.find(params[:id])
    film.destroy


    redirect_to films_path
  end


  private

  def film_params
    params.require(:film).permit(:title, :premiere, :length, :description,
                                 :director, :country, :category,
                                 :screen_writer)
  end
end
