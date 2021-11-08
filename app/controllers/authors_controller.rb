class AuthorsController < ApplicationController
    def show
        @authors = Author.find(params[:id])
    end

    def new
    end

    def create
        @authors = Author.new(author_params)

        @authors.save
        redirect_to @authors
    end


    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end
end
