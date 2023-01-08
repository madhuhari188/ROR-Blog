class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :get_post, only: %i[create show edit update destroy]
  before_action :get_topic, only:%i[create show edit update destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    # @comment = Comment.new
    @comment = @post.comments.build
  end

  # GET /comments/1/edit
  def edit
    authorize! :edit, @comment
  end

  # POST /comments or /comments.json
  def create
    # @comment = Comment.new(comment_params)

    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_post_url(@comment.post.topic_id, @comment.post), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    authorize! :edit, @comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to topic_post_url(@comment.post.topic_id, @comment.post), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    authorize! :destroy, @comment
    @comment.destroy

    respond_to do |format| 
      format.html { redirect_to topic_post_url(@comment.post.topic_id, @comment.post), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end

  def get_post
    @post = Post.find(params[:post_id])
  end
  def get_topic
    @topic = Topic.find(params[:topic_id])
  end
end
