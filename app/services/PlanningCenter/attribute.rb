module PlanningCenter
  class Attribute < Base
    attr_accessor :title,
                  :created_at,
                  :updated_at,
                  :admin,
                  :author,
                  :copyright,
                  :hidden,
                  :themes,
                  :ccli_number,
  end
end