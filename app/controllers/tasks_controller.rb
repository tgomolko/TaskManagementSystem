class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :complete, :uncomplete]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.order(:position)
    @task = Task.new
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
        format.js  { flash[:notice] = "Task was successfully added" }
        format.json { render :show, status: :created, location: @task }
      else
        format.js
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
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    respond_to do |format|
      if @task.update_attributes(:completed => params[:completed])
        format.js  { flash[:notice] = "Task was completed!" }
      end
    end
  end

  def uncomplete
    respond_to do |format|
      if @task.update_attributes(:completed => params[:completed])
        format.js  { flash[:notice] = "Task was incompleted!" }
      end
    end
  end

  def sort
    params[:taskitem].each_with_index do |id, index|
      Task.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def task_position_value
      Task.pluck(:position).to_a.max == nil ?  1 : Task.pluck(:position).to_a.max + 1
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params[:task][:position] = task_position_value
      params.require(:task).permit(:name, :completed, :position)
    end
end
