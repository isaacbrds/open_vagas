class CompaniesController < ApplicationController
  def new
    @company = current_user.build_company
  end

  def create
    @company = current_user.build_company(company_params)
    if @company.save
      flash[:notice] = "Empresa criada com sucesso!"
      redirect_to root_path
    else
      flash[:error] = "Empresa não foi criada"
      render :new
    end
  end

  def update
  end

  def edit
  end

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
