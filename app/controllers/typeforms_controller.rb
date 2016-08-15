class TypeformsController < ApplicationController
  respond_to :html

  before_filter :set_typeform, only: [:show, :edit, :update, :destroy, :view, :check]

  def index
    @typeforms = Typeform.all
  end

  def new
    @typeform = Typeform.new
  end

  def show
  end

  def edit
  end

  def update
    @typeform.update(typeform_params)
    respond_with @typeform
  end

  def create
    @typeform = Typeform.create(typeform_params)
    respond_with @typeform
  end

  def view
    if @typeform.has_been_completed?(current_user)
      redirect_to :root
    end
  end

  def check
    if @typeform.has_been_completed?(current_user)
      render :json => {has_been_completed: true}
      return
    end


    typeform_response = HTTParty.get "https://api.typeform.com/v1/form/#{@typeform.typeform_uid}?key=#{RailsTypeforms.config.key}&completed=true&limit=100"

    completed_responses = typeform_response['responses'].select do |response|
      (response['hidden']['uid'] == current_user.id.to_s) || (response['hidden']['user_id'] == current_user.id.to_s)
    end

    # raise
    if completed_responses.any?
      @typeform.completed_typeforms.create(user_id: current_user.id)
    end

    render :json => {has_been_completed: completed_responses.any?}
  end

  private

  def set_typeform
    @typeform = Typeform.find_by_id(params[:typeform_id]) || Typeform.find(params[:id])
  end

  def typeform_params
    params.require(:typeform).permit(:name, :typeform_uid)
  end
end