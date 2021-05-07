defmodule Integration.ErrorType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :UNKNOWN
          | :DOWNLINK_PAYLOAD_SIZE
          | :DOWNLINK_FCNT
          | :UPLINK_CODEC
          | :DOWNLINK_CODEC
          | :OTAA
          | :UPLINK_FCNT_RESET
          | :UPLINK_MIC
          | :UPLINK_FCNT_RETRANSMISSION
          | :DOWNLINK_GATEWAY

  field :UNKNOWN, 0

  field :DOWNLINK_PAYLOAD_SIZE, 1

  field :DOWNLINK_FCNT, 2

  field :UPLINK_CODEC, 3

  field :DOWNLINK_CODEC, 4

  field :OTAA, 5

  field :UPLINK_FCNT_RESET, 6

  field :UPLINK_MIC, 7

  field :UPLINK_FCNT_RETRANSMISSION, 8

  field :DOWNLINK_GATEWAY, 9
end

defmodule Integration.UplinkEvent.TagsEntry do
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

defmodule Integration.UplinkEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          rx_info: [Gw.UplinkRXInfo.t()],
          tx_info: Gw.UplinkTXInfo.t() | nil,
          adr: boolean,
          dr: non_neg_integer,
          f_cnt: non_neg_integer,
          f_port: non_neg_integer,
          data: binary,
          object_json: String.t(),
          tags: %{String.t() => String.t()},
          confirmed_uplink: boolean,
          dev_addr: binary
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :rx_info,
    :tx_info,
    :adr,
    :dr,
    :f_cnt,
    :f_port,
    :data,
    :object_json,
    :tags,
    :confirmed_uplink,
    :dev_addr
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :rx_info, 5, repeated: true, type: Gw.UplinkRXInfo
  field :tx_info, 6, type: Gw.UplinkTXInfo
  field :adr, 7, type: :bool
  field :dr, 8, type: :uint32
  field :f_cnt, 9, type: :uint32
  field :f_port, 10, type: :uint32
  field :data, 11, type: :bytes
  field :object_json, 12, type: :string
  field :tags, 13, repeated: true, type: Integration.UplinkEvent.TagsEntry, map: true
  field :confirmed_uplink, 14, type: :bool
  field :dev_addr, 15, type: :bytes
end

defmodule Integration.JoinEvent.TagsEntry do
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

defmodule Integration.JoinEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          dev_addr: binary,
          rx_info: [Gw.UplinkRXInfo.t()],
          tx_info: Gw.UplinkTXInfo.t() | nil,
          dr: non_neg_integer,
          tags: %{String.t() => String.t()}
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :dev_addr,
    :rx_info,
    :tx_info,
    :dr,
    :tags
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :dev_addr, 5, type: :bytes
  field :rx_info, 6, repeated: true, type: Gw.UplinkRXInfo
  field :tx_info, 7, type: Gw.UplinkTXInfo
  field :dr, 8, type: :uint32
  field :tags, 9, repeated: true, type: Integration.JoinEvent.TagsEntry, map: true
end

defmodule Integration.AckEvent.TagsEntry do
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

defmodule Integration.AckEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          acknowledged: boolean,
          f_cnt: non_neg_integer,
          tags: %{String.t() => String.t()}
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :acknowledged,
    :f_cnt,
    :tags
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :acknowledged, 5, type: :bool
  field :f_cnt, 6, type: :uint32
  field :tags, 7, repeated: true, type: Integration.AckEvent.TagsEntry, map: true
end

defmodule Integration.TxAckEvent.TagsEntry do
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

defmodule Integration.TxAckEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          f_cnt: non_neg_integer,
          tags: %{String.t() => String.t()},
          gateway_id: binary,
          tx_info: Gw.DownlinkTXInfo.t() | nil
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :f_cnt,
    :tags,
    :gateway_id,
    :tx_info
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :f_cnt, 5, type: :uint32
  field :tags, 6, repeated: true, type: Integration.TxAckEvent.TagsEntry, map: true
  field :gateway_id, 7, type: :bytes
  field :tx_info, 8, type: Gw.DownlinkTXInfo
end

defmodule Integration.ErrorEvent.TagsEntry do
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

defmodule Integration.ErrorEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          type: Integration.ErrorType.t(),
          error: String.t(),
          f_cnt: non_neg_integer,
          tags: %{String.t() => String.t()}
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :type,
    :error,
    :f_cnt,
    :tags
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :type, 5, type: Integration.ErrorType, enum: true
  field :error, 6, type: :string
  field :f_cnt, 7, type: :uint32
  field :tags, 8, repeated: true, type: Integration.ErrorEvent.TagsEntry, map: true
end

defmodule Integration.StatusEvent.TagsEntry do
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

defmodule Integration.StatusEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          margin: integer,
          external_power_source: boolean,
          battery_level_unavailable: boolean,
          battery_level: float | :infinity | :negative_infinity | :nan,
          tags: %{String.t() => String.t()}
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :margin,
    :external_power_source,
    :battery_level_unavailable,
    :battery_level,
    :tags
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :margin, 5, type: :int32
  field :external_power_source, 6, type: :bool
  field :battery_level_unavailable, 7, type: :bool
  field :battery_level, 8, type: :float
  field :tags, 9, repeated: true, type: Integration.StatusEvent.TagsEntry, map: true
end

defmodule Integration.LocationEvent.TagsEntry do
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

defmodule Integration.LocationEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          location: Common.Location.t() | nil,
          tags: %{String.t() => String.t()},
          uplink_ids: [binary],
          f_cnt: non_neg_integer
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :location,
    :tags,
    :uplink_ids,
    :f_cnt
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :location, 5, type: Common.Location
  field :tags, 6, repeated: true, type: Integration.LocationEvent.TagsEntry, map: true
  field :uplink_ids, 7, repeated: true, type: :bytes
  field :f_cnt, 8, type: :uint32
end

defmodule Integration.IntegrationEvent.TagsEntry do
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

defmodule Integration.IntegrationEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: non_neg_integer,
          application_name: String.t(),
          device_name: String.t(),
          dev_eui: binary,
          tags: %{String.t() => String.t()},
          integration_name: String.t(),
          event_type: String.t(),
          object_json: String.t()
        }

  defstruct [
    :application_id,
    :application_name,
    :device_name,
    :dev_eui,
    :tags,
    :integration_name,
    :event_type,
    :object_json
  ]

  field :application_id, 1, type: :uint64
  field :application_name, 2, type: :string
  field :device_name, 3, type: :string
  field :dev_eui, 4, type: :bytes
  field :tags, 5, repeated: true, type: Integration.IntegrationEvent.TagsEntry, map: true
  field :integration_name, 6, type: :string
  field :event_type, 7, type: :string
  field :object_json, 8, type: :string
end
