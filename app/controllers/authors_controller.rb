class AuthorsController < ApplicationController
    before_action :set_author, only: %i[ update destroy ]

    def index
    end

    def new        
    end

    def create
        @author = Author.new(author_params)

        if @author.save
            redirect_to author_url(@author)
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @author.update(author_params)
            redirect_to author_url(@author)
        else
            render :edit
        end
    end

    def destroy
        @author.destroy
        redirect_to authors_url
    end

    private
    def set_author
        @author = Author.find(params[:id])
    end
    def author_params
        params.require(:author).permit(:name, :email, :age)
    end
end
