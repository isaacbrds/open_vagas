class PositionsController < ApplicationController
  before_action :set_company
  before_action :set_position, only: [ :edit, :show, :update, :destroy ]
  def index
    @positions = @company.positions
  end

  def new
    @position = @company.positions.new
  end

  def create
    @position = @company.positions.new(position_params)
    debugger
    if @position.save
      flash[:notice] = "Vaga criada com sucesso!"
      redirect_to positions_path
    else
      flash[:alert] = "Erro ao criar a Vaga!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit;end

  def show;end

  def update
    if @position.update(position_params)
      flash[:notice] = "Vaga atualizada com sucesso!"
      redirect_to positions_path
    else
      flash[:alert] = "Erro ao atualizar a Vaga!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_company
    @company = current_user.company
  end

  def set_position
    @position = @company.positions.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name, :career, :contract, :remote, :city, :state, :summary, :description, :publish)
  end
end
