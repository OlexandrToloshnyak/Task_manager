module ApplicationHelper
    def bootstrap_class_for(name)
        {
            success: "alert-success",
            error: "alert-danger",
            danger: "alert-danger",
            alert: "alert-warning",
            notice: "alert-info"
        }[name.to_sym] || name
    end
    def allow_project_edit?(project)
        if  current_user.id == project.user_id or current_user.admin?
            return true
        else
            return false
        end
      end

    def creator_email(project)
    return current_user.email
    end
end
