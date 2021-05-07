defmodule As.RXWindow do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :RX1 | :RX2

  field :RX1, 0

  field :RX2, 1
end

defmodule As.ErrorType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :GENERIC
          | :OTAA
          | :DATA_UP_FCNT_RESET
          | :DATA_UP_MIC
          | :DEVICE_QUEUE_ITEM_SIZE
          | :DEVICE_QUEUE_ITEM_FCNT
          | :DATA_UP_FCNT_RETRANSMISSION
          | :DATA_DOWN_GATEWAY

  field :GENERIC, 0

  field :OTAA, 1

  field :DATA_UP_FCNT_RESET, 2

  field :DATA_UP_MIC, 3

  field :DEVICE_QUEUE_ITEM_SIZE, 4

  field :DEVICE_QUEUE_ITEM_FCNT, 5

  field :DATA_UP_FCNT_RETRANSMISSION, 6

  field :DATA_DOWN_GATEWAY, 7
end

defmodule As.DeviceActivationContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_addr: binary,
          app_s_key: Common.KeyEnvelope.t() | nil
        }

  defstruct [:dev_addr, :app_s_key]

  field :dev_addr, 1, type: :bytes
  field :app_s_key, 2, type: Common.KeyEnvelope
end

defmodule As.HandleUplinkDataRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: binary,
          join_eui: binary,
          f_cnt: non_neg_integer,
          f_port: non_neg_integer,
          adr: boolean,
          dr: non_neg_integer,
          tx_info: Gw.UplinkTXInfo.t() | nil,
          rx_info: [Gw.UplinkRXInfo.t()],
          data: binary,
          device_activation_context: As.DeviceActivationContext.t() | nil,
          confirmed_uplink: boolean
        }

  defstruct [
    :dev_eui,
    :join_eui,
    :f_cnt,
    :f_port,
    :adr,
    :dr,
    :tx_info,
    :rx_info,
    :data,
    :device_activation_context,
    :confirmed_uplink
  ]

  field :dev_eui, 1, type: :bytes
  field :join_eui, 2, type: :bytes
  field :f_cnt, 3, type: :uint32
  field :f_port, 4, type: :uint32
  field :adr, 5, type: :bool
  field :dr, 6, type: :uint32
  field :tx_info, 7, type: Gw.UplinkTXInfo
  field :rx_info, 8, repeated: true, type: Gw.UplinkRXInfo
  field :data, 9, type: :bytes
  field :device_activation_context, 10, type: As.DeviceActivationContext
  field :confirmed_uplink, 11, type: :bool
end

defmodule As.HandleProprietaryUplinkRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          mac_payload: binary,
          mic: binary,
          tx_info: Gw.UplinkTXInfo.t() | nil,
          rx_info: [Gw.UplinkRXInfo.t()]
        }

  defstruct [:mac_payload, :mic, :tx_info, :rx_info]

  field :mac_payload, 1, type: :bytes
  field :mic, 2, type: :bytes
  field :tx_info, 3, type: Gw.UplinkTXInfo
  field :rx_info, 4, repeated: true, type: Gw.UplinkRXInfo
end

defmodule As.HandleErrorRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: binary,
          type: As.ErrorType.t(),
          error: String.t(),
          f_cnt: non_neg_integer
        }

  defstruct [:dev_eui, :type, :error, :f_cnt]

  field :dev_eui, 1, type: :bytes
  field :type, 3, type: As.ErrorType, enum: true
  field :error, 4, type: :string
  field :f_cnt, 5, type: :uint32
end

defmodule As.HandleDownlinkACKRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: binary,
          f_cnt: non_neg_integer,
          acknowledged: boolean
        }

  defstruct [:dev_eui, :f_cnt, :acknowledged]

  field :dev_eui, 1, type: :bytes
  field :f_cnt, 2, type: :uint32
  field :acknowledged, 3, type: :bool
end

defmodule As.SetDeviceStatusRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: binary,
          battery: non_neg_integer,
          margin: integer,
          external_power_source: boolean,
          battery_level_unavailable: boolean,
          battery_level: float | :infinity | :negative_infinity | :nan
        }

  defstruct [
    :dev_eui,
    :battery,
    :margin,
    :external_power_source,
    :battery_level_unavailable,
    :battery_level
  ]

  field :dev_eui, 1, type: :bytes
  field :battery, 2, type: :uint32
  field :margin, 3, type: :int32
  field :external_power_source, 4, type: :bool
  field :battery_level_unavailable, 5, type: :bool
  field :battery_level, 6, type: :float
end

defmodule As.SetDeviceLocationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: binary,
          location: Common.Location.t() | nil,
          uplink_ids: [binary]
        }

  defstruct [:dev_eui, :location, :uplink_ids]

  field :dev_eui, 1, type: :bytes
  field :location, 2, type: Common.Location
  field :uplink_ids, 3, repeated: true, type: :bytes
end

defmodule As.HandleGatewayStatsRequest.MetadataEntry do
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

defmodule As.HandleGatewayStatsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          gateway_id: binary,
          stats_id: binary,
          time: Google.Protobuf.Timestamp.t() | nil,
          location: Common.Location.t() | nil,
          rx_packets_received: non_neg_integer,
          rx_packets_received_ok: non_neg_integer,
          tx_packets_received: non_neg_integer,
          tx_packets_emitted: non_neg_integer,
          metadata: %{String.t() => String.t()}
        }

  defstruct [
    :gateway_id,
    :stats_id,
    :time,
    :location,
    :rx_packets_received,
    :rx_packets_received_ok,
    :tx_packets_received,
    :tx_packets_emitted,
    :metadata
  ]

  field :gateway_id, 1, type: :bytes
  field :stats_id, 2, type: :bytes
  field :time, 3, type: Google.Protobuf.Timestamp
  field :location, 4, type: Common.Location
  field :rx_packets_received, 5, type: :uint32
  field :rx_packets_received_ok, 6, type: :uint32
  field :tx_packets_received, 7, type: :uint32
  field :tx_packets_emitted, 8, type: :uint32
  field :metadata, 9, repeated: true, type: As.HandleGatewayStatsRequest.MetadataEntry, map: true
end

defmodule As.HandleTxAckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: binary,
          f_cnt: non_neg_integer,
          gateway_id: binary,
          tx_info: Gw.DownlinkTXInfo.t() | nil
        }

  defstruct [:dev_eui, :f_cnt, :gateway_id, :tx_info]

  field :dev_eui, 1, type: :bytes
  field :f_cnt, 2, type: :uint32
  field :gateway_id, 3, type: :bytes
  field :tx_info, 4, type: Gw.DownlinkTXInfo
end

defmodule As.ReEncryptDeviceQueueItemsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: binary,
          dev_addr: binary,
          f_cnt_start: non_neg_integer,
          items: [As.ReEncryptDeviceQueueItem.t()]
        }

  defstruct [:dev_eui, :dev_addr, :f_cnt_start, :items]

  field :dev_eui, 1, type: :bytes
  field :dev_addr, 2, type: :bytes
  field :f_cnt_start, 3, type: :uint32
  field :items, 4, repeated: true, type: As.ReEncryptDeviceQueueItem
end

defmodule As.ReEncryptDeviceQueueItemsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          items: [As.ReEncryptedDeviceQueueItem.t()]
        }

  defstruct [:items]

  field :items, 1, repeated: true, type: As.ReEncryptedDeviceQueueItem
end

defmodule As.ReEncryptDeviceQueueItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frm_payload: binary,
          f_cnt: non_neg_integer,
          f_port: non_neg_integer,
          confirmed: boolean
        }

  defstruct [:frm_payload, :f_cnt, :f_port, :confirmed]

  field :frm_payload, 1, type: :bytes
  field :f_cnt, 2, type: :uint32
  field :f_port, 3, type: :uint32
  field :confirmed, 4, type: :bool
end

defmodule As.ReEncryptedDeviceQueueItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frm_payload: binary,
          f_cnt: non_neg_integer,
          f_port: non_neg_integer,
          confirmed: boolean
        }

  defstruct [:frm_payload, :f_cnt, :f_port, :confirmed]

  field :frm_payload, 1, type: :bytes
  field :f_cnt, 2, type: :uint32
  field :f_port, 3, type: :uint32
  field :confirmed, 4, type: :bool
end

defmodule As.ApplicationServerService.Service do
  @moduledoc false
  use GRPC.Service, name: "as.ApplicationServerService"

  rpc :HandleUplinkData, As.HandleUplinkDataRequest, Google.Protobuf.Empty

  rpc :HandleProprietaryUplink, As.HandleProprietaryUplinkRequest, Google.Protobuf.Empty

  rpc :HandleError, As.HandleErrorRequest, Google.Protobuf.Empty

  rpc :HandleDownlinkACK, As.HandleDownlinkACKRequest, Google.Protobuf.Empty

  rpc :HandleGatewayStats, As.HandleGatewayStatsRequest, Google.Protobuf.Empty

  rpc :HandleTxAck, As.HandleTxAckRequest, Google.Protobuf.Empty

  rpc :SetDeviceStatus, As.SetDeviceStatusRequest, Google.Protobuf.Empty

  rpc :SetDeviceLocation, As.SetDeviceLocationRequest, Google.Protobuf.Empty

  rpc :ReEncryptDeviceQueueItems,
      As.ReEncryptDeviceQueueItemsRequest,
      As.ReEncryptDeviceQueueItemsResponse
end

defmodule As.ApplicationServerService.Stub do
  @moduledoc false
  use GRPC.Stub, service: As.ApplicationServerService.Service
end
