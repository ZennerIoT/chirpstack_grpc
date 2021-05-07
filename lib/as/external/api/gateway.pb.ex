defmodule Api.Gateway.TagsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Api.Gateway.MetadataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Api.Gateway do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          description: String.t(),
          location: Common.Location.t() | nil,
          organization_id: integer,
          discovery_enabled: boolean,
          network_server_id: integer,
          gateway_profile_id: String.t(),
          boards: [Api.GatewayBoard.t()],
          tags: %{String.t() => String.t()},
          metadata: %{String.t() => String.t()},
          service_profile_id: String.t()
        }

  defstruct [
    :id,
    :name,
    :description,
    :location,
    :organization_id,
    :discovery_enabled,
    :network_server_id,
    :gateway_profile_id,
    :boards,
    :tags,
    :metadata,
    :service_profile_id
  ]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :description, 3, type: :string
  field :location, 4, type: Common.Location
  field :organization_id, 5, type: :int64
  field :discovery_enabled, 6, type: :bool
  field :network_server_id, 7, type: :int64
  field :gateway_profile_id, 8, type: :string
  field :boards, 9, repeated: true, type: Api.GatewayBoard
  field :tags, 10, repeated: true, type: Api.Gateway.TagsEntry, map: true
  field :metadata, 11, repeated: true, type: Api.Gateway.MetadataEntry, map: true
  field :service_profile_id, 12, type: :string
end

defmodule Api.GatewayBoard do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fpga_id: String.t(),
          fine_timestamp_key: String.t()
        }

  defstruct [:fpga_id, :fine_timestamp_key]

  field :fpga_id, 1, type: :string
  field :fine_timestamp_key, 2, type: :string
end

defmodule Api.CreateGatewayRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway: Api.Gateway.t() | nil
        }

  defstruct [:gateway]

  field :gateway, 1, type: Api.Gateway
end

defmodule Api.GetGatewayRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetGatewayResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway: Api.Gateway.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil,
          first_seen_at: Google.Protobuf.Timestamp.t() | nil,
          last_seen_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:gateway, :created_at, :updated_at, :first_seen_at, :last_seen_at]

  field :gateway, 1, type: Api.Gateway
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
  field :first_seen_at, 4, type: Google.Protobuf.Timestamp
  field :last_seen_at, 5, type: Google.Protobuf.Timestamp
end

defmodule Api.DeleteGatewayRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GenerateGatewayClientCertificateRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_id: String.t()
        }

  defstruct [:gateway_id]

  field :gateway_id, 1, type: :string
end

defmodule Api.GenerateGatewayClientCertificateResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tls_cert: String.t(),
          tls_key: String.t(),
          ca_cert: String.t(),
          expires_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:tls_cert, :tls_key, :ca_cert, :expires_at]

  field :tls_cert, 1, type: :string
  field :tls_key, 2, type: :string
  field :ca_cert, 3, type: :string
  field :expires_at, 4, type: Google.Protobuf.Timestamp
end

defmodule Api.ListGatewayRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          organization_id: integer,
          search: String.t()
        }

  defstruct [:limit, :offset, :organization_id, :search]

  field :limit, 1, type: :int32
  field :offset, 2, type: :int32
  field :organization_id, 3, type: :int64
  field :search, 4, type: :string
end

defmodule Api.GatewayListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          description: String.t(),
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil,
          first_seen_at: Google.Protobuf.Timestamp.t() | nil,
          last_seen_at: Google.Protobuf.Timestamp.t() | nil,
          organization_id: integer,
          network_server_id: integer,
          location: Common.Location.t() | nil,
          network_server_name: String.t()
        }

  defstruct [
    :id,
    :name,
    :description,
    :created_at,
    :updated_at,
    :first_seen_at,
    :last_seen_at,
    :organization_id,
    :network_server_id,
    :location,
    :network_server_name
  ]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :description, 3, type: :string
  field :created_at, 4, type: Google.Protobuf.Timestamp
  field :updated_at, 5, type: Google.Protobuf.Timestamp
  field :first_seen_at, 8, type: Google.Protobuf.Timestamp
  field :last_seen_at, 9, type: Google.Protobuf.Timestamp
  field :organization_id, 6, type: :int64
  field :network_server_id, 7, type: :int64
  field :location, 10, type: Common.Location
  field :network_server_name, 11, type: :string
end

defmodule Api.ListGatewayResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.GatewayListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.GatewayListItem
end

defmodule Api.UpdateGatewayRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway: Api.Gateway.t() | nil
        }

  defstruct [:gateway]

  field :gateway, 1, type: Api.Gateway
end

defmodule Api.GatewayStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timestamp: Google.Protobuf.Timestamp.t() | nil,
          rx_packets_received: integer,
          rx_packets_received_ok: integer,
          tx_packets_received: integer,
          tx_packets_emitted: integer
        }

  defstruct [
    :timestamp,
    :rx_packets_received,
    :rx_packets_received_ok,
    :tx_packets_received,
    :tx_packets_emitted
  ]

  field :timestamp, 1, type: Google.Protobuf.Timestamp
  field :rx_packets_received, 2, type: :int32
  field :rx_packets_received_ok, 3, type: :int32
  field :tx_packets_received, 4, type: :int32
  field :tx_packets_emitted, 5, type: :int32
end

defmodule Api.GetGatewayStatsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_id: String.t(),
          interval: String.t(),
          start_timestamp: Google.Protobuf.Timestamp.t() | nil,
          end_timestamp: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:gateway_id, :interval, :start_timestamp, :end_timestamp]

  field :gateway_id, 1, type: :string
  field :interval, 2, type: :string
  field :start_timestamp, 3, type: Google.Protobuf.Timestamp
  field :end_timestamp, 4, type: Google.Protobuf.Timestamp
end

defmodule Api.GetGatewayStatsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: [Api.GatewayStats.t()]
        }

  defstruct [:result]

  field :result, 1, repeated: true, type: Api.GatewayStats
end

defmodule Api.PingRX do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_id: String.t(),
          rssi: integer,
          lora_snr: float | :infinity | :negative_infinity | :nan,
          latitude: float | :infinity | :negative_infinity | :nan,
          longitude: float | :infinity | :negative_infinity | :nan,
          altitude: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:gateway_id, :rssi, :lora_snr, :latitude, :longitude, :altitude]

  field :gateway_id, 1, type: :string
  field :rssi, 2, type: :int32
  field :lora_snr, 3, type: :double
  field :latitude, 4, type: :double
  field :longitude, 5, type: :double
  field :altitude, 6, type: :double
end

defmodule Api.GetLastPingRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_id: String.t()
        }

  defstruct [:gateway_id]

  field :gateway_id, 1, type: :string
end

defmodule Api.GetLastPingResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          created_at: Google.Protobuf.Timestamp.t() | nil,
          frequency: non_neg_integer,
          dr: non_neg_integer,
          ping_rx: [Api.PingRX.t()]
        }

  defstruct [:created_at, :frequency, :dr, :ping_rx]

  field :created_at, 1, type: Google.Protobuf.Timestamp
  field :frequency, 2, type: :uint32
  field :dr, 3, type: :uint32
  field :ping_rx, 4, repeated: true, type: Api.PingRX
end

defmodule Api.StreamGatewayFrameLogsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_id: String.t()
        }

  defstruct [:gateway_id]

  field :gateway_id, 1, type: :string
end

defmodule Api.StreamGatewayFrameLogsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frame: {atom, any}
        }

  defstruct [:frame]

  oneof :frame, 0
  field :uplink_frame, 1, type: Api.UplinkFrameLog, oneof: 0
  field :downlink_frame, 2, type: Api.DownlinkFrameLog, oneof: 0
end

defmodule Api.GatewayService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.GatewayService"

  rpc :Create, Api.CreateGatewayRequest, Google.Protobuf.Empty

  rpc :Get, Api.GetGatewayRequest, Api.GetGatewayResponse

  rpc :Update, Api.UpdateGatewayRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteGatewayRequest, Google.Protobuf.Empty

  rpc :List, Api.ListGatewayRequest, Api.ListGatewayResponse

  rpc :GetStats, Api.GetGatewayStatsRequest, Api.GetGatewayStatsResponse

  rpc :GetLastPing, Api.GetLastPingRequest, Api.GetLastPingResponse

  rpc :GenerateGatewayClientCertificate,
      Api.GenerateGatewayClientCertificateRequest,
      Api.GenerateGatewayClientCertificateResponse

  rpc :StreamFrameLogs,
      Api.StreamGatewayFrameLogsRequest,
      stream(Api.StreamGatewayFrameLogsResponse)
end

defmodule Api.GatewayService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.GatewayService.Service
end
