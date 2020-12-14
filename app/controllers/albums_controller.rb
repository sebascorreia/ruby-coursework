class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_band, only:[:new, :create]
  before_action :find_band, only:[:new, :create, :index, :edit, :update] #find band to be able to redirect back to previous forms and other stuff
  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create

    @album = @band.albums.new(album_params) # create album inside of band

    respond_to do |format|
      if @album.save
        format.html { redirect_to band_albums_path(@album.band_id), notice: 'Album was successfully created.' } #redirect to albums index
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to band_albums_path(@album.band_id), notice: 'Album was successfully updated.' } #redirect to albums index
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to band_albums_path(@album.band_id), notice: 'Album was successfully destroyed.' }
      format.js {flash[:notice] = 'Album was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band  #find the albums band
      @band = Band.find_by(id: params[:band_id]) ||
      Band.find(album_params[:band_id])
    end

    def find_band
      @band= Band.find(params[:band_id])
    end

    def set_album
        #puts album_params.inspect
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:band_id, :name, :year)
    end
end
