class CompaniesController < ApplicationController
  def new
    @company = current_user.build_company
  end

  def create
    @company = current_user.build_company(company_params)
    debugger
    if @company.save
      flash[:notice] = "Empresa criada com sucesso!"
      redirect_to root_path
    else
      flash[:error] = "Empresa não foi criada"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @company = current_user.company
    if @company.update(company_params)
      flash[:notice] = "Empresa criada com sucesso!"
      redirect_to root_path
    else
      flash[:error] = "Empresa não foi criada"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @company = current_user.company
  end

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
