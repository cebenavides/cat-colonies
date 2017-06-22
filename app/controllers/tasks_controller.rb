class TasksController < ApplicationController
  before_action :auth_user
  before_action :verify_is_admin, only: [:new]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    if current_user.admin?
      @tasks = Task.all
    else
      @tasks = current_user.tasks
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :start_date, :user_id)
    end
    
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path, notice: "You're not authorized to enter here.") unless current_user.admin?)
    end
    
    def auth_user
      redirect_to root_path unless current_user
    end
end
