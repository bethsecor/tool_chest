class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    # @tools = Tool.all
    unless current_user.tools.empty?
      @tools = current_user.tools
      session[:most_recent_tool_id] = @tools.last.id
    else
      @tools = []
    end
  end

  def show
    @tool
  end

  # def new
  #   @tool = Tool.new
  # end
  #
  # def create
  #   @tool = Tool.new(tool_params)
  #   @tool.user_id = current_user.id
  #   if @tool.save
  #     flash[:notice] = "Tool #{@tool.name} created!"
  #     redirect_to tools_path
  #   else
  #     flash[:error] = @tool.errors.full_messages.join(", ")
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @tool
  # end
  #
  # def update
  #   @tool.update(tool_params)
  #   redirect_to tools_path
  # end
  #
  # def destroy
  #   @tool.destroy
  #   redirect_to tools_path
  # end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end
  #
  # def tool_params
  #   params.require(:tool).permit(:name, :use)
  # end
end
