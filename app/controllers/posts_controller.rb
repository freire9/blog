class PostsController < ApplicationController

    def index
        @post = Post.all.order('created_at DESC')
    end

    def new
        @post= Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
        else
            render "new"
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
        def post_params
            #por que :posts y no post
            params.require(:posts).permit(:title, :body)
        end
end
