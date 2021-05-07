defmodule Api.Organization do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          display_name: String.t(),
          can_have_gateways: boolean,
          max_gateway_count: non_neg_integer,
          max_device_count: non_neg_integer
        }

  defstruct [:id, :name, :display_name, :can_have_gateways, :max_gateway_count, :max_device_count]

  field :id, 1, type: :int64
  field :name, 2, type: :string
  field :display_name, 3, type: :string
  field :can_have_gateways, 4, type: :bool
  field :max_gateway_count, 5, type: :uint32
  field :max_device_count, 6, type: :uint32
end

defmodule Api.OrganizationListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          display_name: String.t(),
          can_have_gateways: boolean,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:id, :name, :display_name, :can_have_gateways, :created_at, :updated_at]

  field :id, 1, type: :int64
  field :name, 2, type: :string
  field :display_name, 3, type: :string
  field :can_have_gateways, 4, type: :bool
  field :created_at, 5, type: Google.Protobuf.Timestamp
  field :updated_at, 6, type: Google.Protobuf.Timestamp
end

defmodule Api.GetOrganizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.GetOrganizationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization: Api.Organization.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:organization, :created_at, :updated_at]

  field :organization, 1, type: Api.Organization
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
end

defmodule Api.CreateOrganizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization: Api.Organization.t() | nil
        }

  defstruct [:organization]

  field :organization, 1, type: Api.Organization
end

defmodule Api.CreateOrganizationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.UpdateOrganizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization: Api.Organization.t() | nil
        }

  defstruct [:organization]

  field :organization, 1, type: Api.Organization
end

defmodule Api.DeleteOrganizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.ListOrganizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          search: String.t()
        }

  defstruct [:limit, :offset, :search]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :search, 3, type: :string
end

defmodule Api.ListOrganizationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.OrganizationListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.OrganizationListItem
end

defmodule Api.OrganizationUser do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer,
          user_id: integer,
          is_admin: boolean,
          is_device_admin: boolean,
          is_gateway_admin: boolean,
          email: String.t()
        }

  defstruct [:organization_id, :user_id, :is_admin, :is_device_admin, :is_gateway_admin, :email]

  field :organization_id, 1, type: :int64
  field :user_id, 2, type: :int64
  field :is_admin, 3, type: :bool
  field :is_device_admin, 5, type: :bool
  field :is_gateway_admin, 6, type: :bool
  field :email, 4, type: :string
end

defmodule Api.OrganizationUserListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user_id: integer,
          email: String.t(),
          is_admin: boolean,
          is_device_admin: boolean,
          is_gateway_admin: boolean,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [
    :user_id,
    :email,
    :is_admin,
    :is_device_admin,
    :is_gateway_admin,
    :created_at,
    :updated_at
  ]

  field :user_id, 1, type: :int64
  field :email, 2, type: :string
  field :is_admin, 3, type: :bool
  field :is_device_admin, 6, type: :bool
  field :is_gateway_admin, 7, type: :bool
  field :created_at, 4, type: Google.Protobuf.Timestamp
  field :updated_at, 5, type: Google.Protobuf.Timestamp
end

defmodule Api.AddOrganizationUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_user: Api.OrganizationUser.t() | nil
        }

  defstruct [:organization_user]

  field :organization_user, 1, type: Api.OrganizationUser
end

defmodule Api.UpdateOrganizationUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_user: Api.OrganizationUser.t() | nil
        }

  defstruct [:organization_user]

  field :organization_user, 1, type: Api.OrganizationUser
end

defmodule Api.DeleteOrganizationUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer,
          user_id: integer
        }

  defstruct [:organization_id, :user_id]

  field :organization_id, 1, type: :int64
  field :user_id, 2, type: :int64
end

defmodule Api.ListOrganizationUsersRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer,
          limit: integer,
          offset: integer
        }

  defstruct [:organization_id, :limit, :offset]

  field :organization_id, 1, type: :int64
  field :limit, 2, type: :int32
  field :offset, 3, type: :int32
end

defmodule Api.ListOrganizationUsersResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.OrganizationUserListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.OrganizationUserListItem
end

defmodule Api.GetOrganizationUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer,
          user_id: integer
        }

  defstruct [:organization_id, :user_id]

  field :organization_id, 1, type: :int64
  field :user_id, 2, type: :int64
end

defmodule Api.GetOrganizationUserResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_user: Api.OrganizationUser.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:organization_user, :created_at, :updated_at]

  field :organization_user, 1, type: Api.OrganizationUser
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
end

defmodule Api.OrganizationService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.OrganizationService"

  rpc :List, Api.ListOrganizationRequest, Api.ListOrganizationResponse

  rpc :Get, Api.GetOrganizationRequest, Api.GetOrganizationResponse

  rpc :Create, Api.CreateOrganizationRequest, Api.CreateOrganizationResponse

  rpc :Update, Api.UpdateOrganizationRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteOrganizationRequest, Google.Protobuf.Empty

  rpc :ListUsers, Api.ListOrganizationUsersRequest, Api.ListOrganizationUsersResponse

  rpc :GetUser, Api.GetOrganizationUserRequest, Api.GetOrganizationUserResponse

  rpc :AddUser, Api.AddOrganizationUserRequest, Google.Protobuf.Empty

  rpc :UpdateUser, Api.UpdateOrganizationUserRequest, Google.Protobuf.Empty

  rpc :DeleteUser, Api.DeleteOrganizationUserRequest, Google.Protobuf.Empty
end

defmodule Api.OrganizationService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.OrganizationService.Service
end
