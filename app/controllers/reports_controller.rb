class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  def index
    @reports = Report.all

    render json: @reports
  end

  def show
    render json: @report
  end

  def pdf
    @reports = Report.all
    @reports = @reports.includes(:comment).where("comments.denounce": to_bool(params[:denounce])) if params[:denounce].present?

    html = ERB.new(File.read "app/views/reports/pdf.html.erb").result(binding)
    pdf_file = PDFKit.new(html, page_size: 'A4', dpi: 900).to_pdf

    send_data(pdf_file, filename: 'report.pdf', disposition: 'inline', type: :pdf)
  end	

  def create
    @report = Report.new(report_params)

    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def update
    if not(report_params.empty?) && @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy
  end

  private
  def to_bool(value)
    ActiveModel::Type::Boolean.new.cast(value)
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:comment_id, :user_id)
  end
end
