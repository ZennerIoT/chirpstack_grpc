defmodule Api.User do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          session_ttl: integer,
          is_admin: boolean,
          is_active: boolean,
          email: String.t(),
          note: String.t()
        }

  defstruct [:id, :session_ttl, :is_admin, :is_active, :email, :note]

  field :id, 1, type: :int64
  field :session_ttl, 3, type: :int32
  field :is_admin, 4, type: :bool
  field :is_active, 5, type: :bool
  field :email, 6, type: :string
  field :note, 7, type: :string
end

defmodule Api.UserListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          email: String.t(),
          session_ttl: integer,
          is_admin: boolean,
          is_active: boolean,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:id, :email, :session_ttl, :is_admin, :is_active, :created_at, :updated_at]

  field :id, 1, type: :int64
  field :email, 2, type: :string
  field :session_ttl, 3, type: :int32
  field :is_admin, 4, type: :bool
  field :is_active, 5, type: :bool
  field :created_at, 8, type: Google.Protobuf.Timestamp
  field :updated_at, 9, type: Google.Protobuf.Timestamp
end

defmodule Api.UserOrganization do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer,
          is_admin: boolean,
          is_device_admin: boolean,
          is_gateway_admin: boolean
        }

  defstruct [:organization_id, :is_admin, :is_device_admin, :is_gateway_admin]

  field :organization_id, 1, type: :int64
  field :is_admin, 2, type: :bool
  field :is_device_admin, 3, type: :bool
  field :is_gateway_admin, 4, type: :bool
end

defmodule Api.CreateUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user: Api.User.t() | nil,
          password: String.t(),
          organizations: [Api.UserOrganization.t()]
        }

  defstruct [:user, :password, :organizations]

  field :user, 1, type: Api.User
  field :password, 2, type: :string
  field :organizations, 3, repeated: true, type: Api.UserOrganization
end

defmodule Api.CreateUserResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.GetUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.GetUserResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user: Api.User.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:user, :created_at, :updated_at]

  field :user, 1, type: Api.User
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
end

defmodule Api.UpdateUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user: Api.User.t() | nil
        }

  defstruct [:user]

  field :user, 1, type: Api.User
end

defmodule Api.DeleteUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.ListUserRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer
        }

  defstruct [:limit, :offset]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
end

defmodule Api.ListUserResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.UserListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.UserListItem
end

defmodule Api.UpdateUserPasswordRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user_id: integer,
          password: String.t()
        }

  defstruct [:user_id, :password]

  field :user_id, 1, type: :int64
  field :password, 2, type: :string
end

defmodule Api.UserService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.UserService"

  rpc :List, Api.ListUserRequest, Api.ListUserResponse

  rpc :Get, Api.GetUserRequest, Api.GetUserResponse

  rpc :Create, Api.CreateUserRequest, Api.CreateUserResponse

  rpc :Update, Api.UpdateUserRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteUserRequest, Google.Protobuf.Empty

  rpc :UpdatePassword, Api.UpdateUserPasswordRequest, Google.Protobuf.Empty
end

defmodule Api.UserService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.UserService.Service
end
