defmodule Api.GatewayProfile do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          network_server_id: integer,
          channels: [non_neg_integer],
          extra_channels: [Api.GatewayProfileExtraChannel.t()],
          stats_interval: Google.Protobuf.Duration.t() | nil
        }

  defstruct [:id, :name, :network_server_id, :channels, :extra_channels, :stats_interval]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :network_server_id, 3, type: :int64
  field :channels, 4, repeated: true, type: :uint32
  field :extra_channels, 5, repeated: true, type: Api.GatewayProfileExtraChannel
  field :stats_interval, 6, type: Google.Protobuf.Duration
end

defmodule Api.GatewayProfileListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          network_server_id: integer,
          network_server_name: String.t(),
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:id, :name, :network_server_id, :network_server_name, :created_at, :updated_at]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :network_server_id, 3, type: :int64
  field :network_server_name, 7, type: :string
  field :created_at, 5, type: Google.Protobuf.Timestamp
  field :updated_at, 6, type: Google.Protobuf.Timestamp
end

defmodule Api.GatewayProfileExtraChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          modulation: Common.Modulation.t(),
          frequency: non_neg_integer,
          bandwidth: non_neg_integer,
          bitrate: non_neg_integer,
          spreading_factors: [non_neg_integer]
        }

  defstruct [:modulation, :frequency, :bandwidth, :bitrate, :spreading_factors]

  field :modulation, 1, type: Common.Modulation, enum: true
  field :frequency, 2, type: :uint32
  field :bandwidth, 3, type: :uint32
  field :bitrate, 4, type: :uint32
  field :spreading_factors, 5, repeated: true, type: :uint32
end

defmodule Api.CreateGatewayProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_profile: Api.GatewayProfile.t() | nil
        }

  defstruct [:gateway_profile]

  field :gateway_profile, 1, type: Api.GatewayProfile
end

defmodule Api.CreateGatewayProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetGatewayProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetGatewayProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_profile: Api.GatewayProfile.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:gateway_profile, :created_at, :updated_at]

  field :gateway_profile, 1, type: Api.GatewayProfile
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
end

defmodule Api.UpdateGatewayProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_profile: Api.GatewayProfile.t() | nil
        }

  defstruct [:gateway_profile]

  field :gateway_profile, 1, type: Api.GatewayProfile
end

defmodule Api.DeleteGatewayProfileRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.ListGatewayProfilesRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          network_server_id: integer
        }

  defstruct [:limit, :offset, :network_server_id]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :network_server_id, 3, type: :int64
end

defmodule Api.ListGatewayProfilesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.GatewayProfileListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.GatewayProfileListItem
end

defmodule Api.GatewayProfileService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.GatewayProfileService"

  rpc :Create, Api.CreateGatewayProfileRequest, Api.CreateGatewayProfileResponse

  rpc :Get, Api.GetGatewayProfileRequest, Api.GetGatewayProfileResponse

  rpc :Update, Api.UpdateGatewayProfileRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteGatewayProfileRequest, Google.Protobuf.Empty

  rpc :List, Api.ListGatewayProfilesRequest, Api.ListGatewayProfilesResponse
end

defmodule Api.GatewayProfileService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.GatewayProfileService.Service
end
