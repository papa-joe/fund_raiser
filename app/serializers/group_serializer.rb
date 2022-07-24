class GroupSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :group_type, :description, :cheque_name, :city, :state, :address
  belongs_to :user
end
