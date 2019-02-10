class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all

    render json: @comments
  end

  def report
    @comments = Comment.all
    
    html = ERB.new(File.read "app/views/comments/report.html.erb").result(binding)
    kit = PDFKit.new(html, page_size: 'A4', dpi: 900)
    pdf = kit.to_pdf

    send_data(pdf, filename: 'report.pdf', disposition: 'inline', type: :pdf)
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if not(comment_params.empty?) && @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text, :user_id, :event_id)
    end
  end
