class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.all.find(params[:id])
    end

    def new
        @blogger = Blogger.new()
    end

    def create
        @blogger = Blogger.new(name: params[:name], age: params[:age], bio: params[:bio])
        if @blogger.valid?
            @blogger.save
            redirect_to "/bloggers/#{@blogger.id}"
        else
            flash[:messages] = @blogger.errors.messages
            redirect_to "/bloggers/new"
        end
    end

end