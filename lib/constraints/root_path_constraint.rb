module Constraints
  class RootPathConstraint
    def matches?(request)
      request.session[:user_id].present?
    end
  end
end