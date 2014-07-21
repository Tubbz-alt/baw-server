class BookmarksController < ApplicationController
  load_and_authorize_resource :bookmark
  respond_to :html, only: [:index, :show]
  respond_to :json

  # GET /bookmarks
  # GET /bookmarks.json
  def index

    cleaned_params = CleanParams.perform(params)

    query = Bookmark.scoped

    unless params[:name].blank?
      query = query.merge(Bookmark.filter_by_name(cleaned_params[:name]))
    end

    unless params[:category].blank?
      query = query.merge(Bookmark.filter_by_category(cleaned_params[:category]))
    end

    @bookmarks = query
    #@bookmarks = [{hi: 'hello', boring: :yes}, {hi: 4565, boring: :yes}]

    respond_with @bookmarks
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
    @bookmark = Bookmark.where(id: params[:id]).first
    respond_with @bookmark
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.json
  def new
    @bookmark = Bookmark.new
    respond_with @bookmark
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(params[:bookmark])

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render json: @bookmark, status: :created, location: @bookmark }
      else
        format.html { render action: 'new' }
        format.json { render @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.json
  def update
    @bookmark = Bookmark.where(id: params[:id]).first

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark = Bookmark.where(id: params[:id]).first
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end
end
