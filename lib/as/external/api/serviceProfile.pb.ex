defmodule Api.CreateServiceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service_profile: Api.ServiceProfile.t() | nil
        }

  defstruct [:service_profile]

  field :service_profile, 1, type: Api.ServiceProfile
end

defmodule Api.CreateServiceProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetServiceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetServiceProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service_profile: Api.ServiceProfile.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:service_profile, :created_at, :updated_at]

  field :service_profile, 1, type: Api.ServiceProfile
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
end

defmodule Api.UpdateServiceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service_profile: Api.ServiceProfile.t() | nil
        }

  defstruct [:service_profile]

  field :service_profile, 1, type: Api.ServiceProfile
end

defmodule Api.DeleteServiceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.ListServiceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          organization_id: integer,
          network_server_id: integer
        }

  defstruct [:limit, :offset, :organization_id, :network_server_id]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :organization_id, 3, type: :int64
  field :network_server_id, 4, type: :int64
end

defmodule Api.ServiceProfileListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          organization_id: integer,
          network_server_id: integer,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil,
          network_server_name: String.t()
        }

  defstruct [
    :id,
    :name,
    :organization_id,
    :network_server_id,
    :created_at,
    :updated_at,
    :network_server_name
  ]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :organization_id, 3, type: :int64
  field :network_server_id, 4, type: :int64
  field :created_at, 5, type: Google.Protobuf.Timestamp
  field :updated_at, 6, type: Google.Protobuf.Timestamp
  field :network_server_name, 7, type: :string
end

defmodule Api.ListServiceProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.ServiceProfileListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.ServiceProfileListItem
end

defmodule Api.ServiceProfileService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.ServiceProfileService"

  rpc :Create, Api.CreateServiceProfileRequest, Api.CreateServiceProfileResponse

  rpc :Get, Api.GetServiceProfileRequest, Api.GetServiceProfileResponse

  rpc :Update, Api.UpdateServiceProfileRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteServiceProfileRequest, Google.Protobuf.Empty

  rpc :List, Api.ListServiceProfileRequest, Api.ListServiceProfileResponse
end

defmodule Api.ServiceProfileService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.ServiceProfileService.Service
end
