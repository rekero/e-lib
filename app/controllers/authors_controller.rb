class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show]
  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  @books = Book.all
  end
  
  def add_book
 # Book.all.each do |book|
 # if book.id = 
 # @books = Book.Where[book.id]
#	@author.books = @books
  end
  
  def results  
  #@authors = Author.find_by name: params[:name] 
  @au = Author.where("name = ?", params[:name])
  @count = 0
  @author = Author.all.first
 # @author = @au.first
  Author.all.each do |a|
	if a == @au
		@count = a.id
		@author = a
	end
	end
 # @author = Author.first.id
 # @au = @authors.id
 # @aut = Author.find_by_name(params[:name]).id
 # @author = @authors.id
 # @assignments = Assignment.all.find_by_author_id(@count)
 # Assignment.all.each do |ass|
 # if ass.author_id == count
#	@books =+ Book.where("id = ?", ass.book_id)
#	end
#	end
  
 # @author = Author.find(params[:@authors.first.id])
 # @books = Book.joins(:assignment).where('assignments.author_id.name = ?', params[:name])
  @books = @author.books
  end
  
  def searcha #search books by author
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render action: 'show', status: :created, location: @author }
      else
        format.html { render action: 'new' }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name)
    end
end
