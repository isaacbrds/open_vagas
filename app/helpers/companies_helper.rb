module CompaniesHelper
  def dinamic_url
    if current_user.company.present? && current_user.company.try(:id).present?
      edit_company_path(current_user.company)
    else
      new_company_path
    end
  end
end
