class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end 

    def show
        @authors = Author.find(params[:id])
    end

    def new
        @authors = Author.new
    end

    def create
        @authors = Author.new(author_params)
        
        if @authors.save
            redirect_to @authors
        else
            render 'new'
        end
    end


    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end
end
