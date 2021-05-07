defmodule Api.CreateDeviceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_profile: Api.DeviceProfile.t() | nil
        }

  defstruct [:device_profile]

  field :device_profile, 1, type: Api.DeviceProfile
end

defmodule Api.CreateDeviceProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetDeviceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetDeviceProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_profile: Api.DeviceProfile.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:device_profile, :created_at, :updated_at]

  field :device_profile, 1, type: Api.DeviceProfile
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
end

defmodule Api.UpdateDeviceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_profile: Api.DeviceProfile.t() | nil
        }

  defstruct [:device_profile]

  field :device_profile, 1, type: Api.DeviceProfile
end

defmodule Api.DeleteDeviceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.DeviceProfileListItem do
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

defmodule Api.ListDeviceProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          organization_id: integer,
          application_id: integer
        }

  defstruct [:limit, :offset, :organization_id, :application_id]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :organization_id, 3, type: :int64
  field :application_id, 4, type: :int64
end

defmodule Api.ListDeviceProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.DeviceProfileListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.DeviceProfileListItem
end

defmodule Api.DeviceProfileService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.DeviceProfileService"

  rpc :Create, Api.CreateDeviceProfileRequest, Api.CreateDeviceProfileResponse

  rpc :Get, Api.GetDeviceProfileRequest, Api.GetDeviceProfileResponse

  rpc :Update, Api.UpdateDeviceProfileRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteDeviceProfileRequest, Google.Protobuf.Empty

  rpc :List, Api.ListDeviceProfileRequest, Api.ListDeviceProfileResponse
end

defmodule Api.DeviceProfileService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.DeviceProfileService.Service
end
