defmodule Api.NetworkServer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          server: String.t(),
          ca_cert: String.t(),
          tls_cert: String.t(),
          tls_key: String.t(),
          routing_profile_ca_cert: String.t(),
          routing_profile_tls_cert: String.t(),
          routing_profile_tls_key: String.t(),
          gateway_discovery_enabled: boolean,
          gateway_discovery_interval: non_neg_integer,
          gateway_discovery_tx_frequency: non_neg_integer,
          gateway_discovery_dr: non_neg_integer
        }

  defstruct [
    :id,
    :name,
    :server,
    :ca_cert,
    :tls_cert,
    :tls_key,
    :routing_profile_ca_cert,
    :routing_profile_tls_cert,
    :routing_profile_tls_key,
    :gateway_discovery_enabled,
    :gateway_discovery_interval,
    :gateway_discovery_tx_frequency,
    :gateway_discovery_dr
  ]

  field :id, 1, type: :int64
  field :name, 2, type: :string
  field :server, 3, type: :string
  field :ca_cert, 4, type: :string
  field :tls_cert, 5, type: :string
  field :tls_key, 6, type: :string
  field :routing_profile_ca_cert, 7, type: :string
  field :routing_profile_tls_cert, 8, type: :string
  field :routing_profile_tls_key, 9, type: :string
  field :gateway_discovery_enabled, 10, type: :bool
  field :gateway_discovery_interval, 11, type: :uint32
  field :gateway_discovery_tx_frequency, 12, type: :uint32
  field :gateway_discovery_dr, 13, type: :uint32
end

defmodule Api.NetworkServerListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          server: String.t(),
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:id, :name, :server, :created_at, :updated_at]

  field :id, 1, type: :int64
  field :name, 2, type: :string
  field :server, 3, type: :string
  field :created_at, 4, type: Google.Protobuf.Timestamp
  field :updated_at, 5, type: Google.Protobuf.Timestamp
end

defmodule Api.CreateNetworkServerRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          network_server: Api.NetworkServer.t() | nil
        }

  defstruct [:network_server]

  field :network_server, 1, type: Api.NetworkServer
end

defmodule Api.CreateNetworkServerResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.GetNetworkServerRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.GetNetworkServerResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          network_server: Api.NetworkServer.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil,
          version: String.t(),
          region: String.t()
        }

  defstruct [:network_server, :created_at, :updated_at, :version, :region]

  field :network_server, 1, type: Api.NetworkServer
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
  field :version, 4, type: :string
  field :region, 5, type: :string
end

defmodule Api.UpdateNetworkServerRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          network_server: Api.NetworkServer.t() | nil
        }

  defstruct [:network_server]

  field :network_server, 1, type: Api.NetworkServer
end

defmodule Api.DeleteNetworkServerRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.ListNetworkServerRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          organization_id: integer
        }

  defstruct [:limit, :offset, :organization_id]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :organization_id, 3, type: :int64
end

defmodule Api.ListNetworkServerResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.NetworkServerListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.NetworkServerListItem
end

defmodule Api.GetADRAlgorithmsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          network_server_id: integer
        }

  defstruct [:network_server_id]

  field :network_server_id, 1, type: :int64
end

defmodule Api.GetADRAlgorithmsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          adr_algorithms: [Api.ADRAlgorithm.t()]
        }

  defstruct [:adr_algorithms]

  field :adr_algorithms, 1, repeated: true, type: Api.ADRAlgorithm
end

defmodule Api.ADRAlgorithm do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t()
        }

  defstruct [:id, :name]

  field :id, 1, type: :string
  field :name, 2, type: :string
end

defmodule Api.NetworkServerService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.NetworkServerService"

  rpc :Create, Api.CreateNetworkServerRequest, Api.CreateNetworkServerResponse

  rpc :Get, Api.GetNetworkServerRequest, Api.GetNetworkServerResponse

  rpc :Update, Api.UpdateNetworkServerRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteNetworkServerRequest, Google.Protobuf.Empty

  rpc :List, Api.ListNetworkServerRequest, Api.ListNetworkServerResponse

  rpc :GetADRAlgorithms, Api.GetADRAlgorithmsRequest, Api.GetADRAlgorithmsResponse
end

defmodule Api.NetworkServerService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.NetworkServerService.Service
end
