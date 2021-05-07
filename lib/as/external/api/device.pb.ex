defmodule Api.Device.VariablesEntry do
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

defmodule Api.Device.TagsEntry do
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

defmodule Api.Device do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t(),
          name: String.t(),
          application_id: integer,
          description: String.t(),
          device_profile_id: String.t(),
          skip_f_cnt_check: boolean,
          reference_altitude: float | :infinity | :negative_infinity | :nan,
          variables: %{String.t() => String.t()},
          tags: %{String.t() => String.t()},
          is_disabled: boolean
        }

  defstruct [
    :dev_eui,
    :name,
    :application_id,
    :description,
    :device_profile_id,
    :skip_f_cnt_check,
    :reference_altitude,
    :variables,
    :tags,
    :is_disabled
  ]

  field :dev_eui, 1, type: :string
  field :name, 2, type: :string
  field :application_id, 3, type: :int64
  field :description, 4, type: :string
  field :device_profile_id, 5, type: :string
  field :skip_f_cnt_check, 6, type: :bool
  field :reference_altitude, 7, type: :double
  field :variables, 8, repeated: true, type: Api.Device.VariablesEntry, map: true
  field :tags, 9, repeated: true, type: Api.Device.TagsEntry, map: true
  field :is_disabled, 10, type: :bool
end

defmodule Api.DeviceListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t(),
          name: String.t(),
          application_id: integer,
          description: String.t(),
          device_profile_id: String.t(),
          device_profile_name: String.t(),
          device_status_battery: non_neg_integer,
          device_status_margin: integer,
          device_status_external_power_source: boolean,
          device_status_battery_level_unavailable: boolean,
          device_status_battery_level: float | :infinity | :negative_infinity | :nan,
          last_seen_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [
    :dev_eui,
    :name,
    :application_id,
    :description,
    :device_profile_id,
    :device_profile_name,
    :device_status_battery,
    :device_status_margin,
    :device_status_external_power_source,
    :device_status_battery_level_unavailable,
    :device_status_battery_level,
    :last_seen_at
  ]

  field :dev_eui, 1, type: :string
  field :name, 2, type: :string
  field :application_id, 3, type: :int64
  field :description, 4, type: :string
  field :device_profile_id, 5, type: :string
  field :device_profile_name, 6, type: :string
  field :device_status_battery, 7, type: :uint32
  field :device_status_margin, 8, type: :int32
  field :device_status_external_power_source, 10, type: :bool
  field :device_status_battery_level_unavailable, 11, type: :bool
  field :device_status_battery_level, 12, type: :float
  field :last_seen_at, 9, type: Google.Protobuf.Timestamp
end

defmodule Api.DeviceKeys do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t(),
          nwk_key: String.t(),
          app_key: String.t(),
          gen_app_key: String.t()
        }

  defstruct [:dev_eui, :nwk_key, :app_key, :gen_app_key]

  field :dev_eui, 1, type: :string
  field :nwk_key, 2, type: :string
  field :app_key, 3, type: :string
  field :gen_app_key, 4, type: :string
end

defmodule Api.CreateDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device: Api.Device.t() | nil
        }

  defstruct [:device]

  field :device, 1, type: Api.Device
end

defmodule Api.GetDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.GetDeviceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device: Api.Device.t() | nil,
          last_seen_at: Google.Protobuf.Timestamp.t() | nil,
          device_status_battery: non_neg_integer,
          device_status_margin: integer,
          location: Common.Location.t() | nil
        }

  defstruct [:device, :last_seen_at, :device_status_battery, :device_status_margin, :location]

  field :device, 1, type: Api.Device
  field :last_seen_at, 5, type: Google.Protobuf.Timestamp
  field :device_status_battery, 6, type: :uint32
  field :device_status_margin, 20, type: :int32
  field :location, 21, type: Common.Location
end

defmodule Api.ListDeviceRequest.TagsEntry do
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

defmodule Api.ListDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          application_id: integer,
          search: String.t(),
          multicast_group_id: String.t(),
          service_profile_id: String.t(),
          tags: %{String.t() => String.t()}
        }

  defstruct [
    :limit,
    :offset,
    :application_id,
    :search,
    :multicast_group_id,
    :service_profile_id,
    :tags
  ]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :application_id, 3, type: :int64
  field :search, 4, type: :string
  field :multicast_group_id, 5, type: :string
  field :service_profile_id, 6, type: :string
  field :tags, 7, repeated: true, type: Api.ListDeviceRequest.TagsEntry, map: true
end

defmodule Api.ListDeviceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.DeviceListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.DeviceListItem
end

defmodule Api.DeleteDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.UpdateDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device: Api.Device.t() | nil
        }

  defstruct [:device]

  field :device, 1, type: Api.Device
end

defmodule Api.CreateDeviceKeysRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_keys: Api.DeviceKeys.t() | nil
        }

  defstruct [:device_keys]

  field :device_keys, 1, type: Api.DeviceKeys
end

defmodule Api.GetDeviceKeysRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.GetDeviceKeysResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_keys: Api.DeviceKeys.t() | nil
        }

  defstruct [:device_keys]

  field :device_keys, 1, type: Api.DeviceKeys
end

defmodule Api.UpdateDeviceKeysRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_keys: Api.DeviceKeys.t() | nil
        }

  defstruct [:device_keys]

  field :device_keys, 1, type: Api.DeviceKeys
end

defmodule Api.DeleteDeviceKeysRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.DeviceActivation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t(),
          dev_addr: String.t(),
          app_s_key: String.t(),
          nwk_s_enc_key: String.t(),
          s_nwk_s_int_key: String.t(),
          f_nwk_s_int_key: String.t(),
          f_cnt_up: non_neg_integer,
          n_f_cnt_down: non_neg_integer,
          a_f_cnt_down: non_neg_integer
        }

  defstruct [
    :dev_eui,
    :dev_addr,
    :app_s_key,
    :nwk_s_enc_key,
    :s_nwk_s_int_key,
    :f_nwk_s_int_key,
    :f_cnt_up,
    :n_f_cnt_down,
    :a_f_cnt_down
  ]

  field :dev_eui, 1, type: :string
  field :dev_addr, 2, type: :string
  field :app_s_key, 3, type: :string
  field :nwk_s_enc_key, 4, type: :string
  field :s_nwk_s_int_key, 8, type: :string
  field :f_nwk_s_int_key, 9, type: :string
  field :f_cnt_up, 5, type: :uint32
  field :n_f_cnt_down, 6, type: :uint32
  field :a_f_cnt_down, 10, type: :uint32
end

defmodule Api.ActivateDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_activation: Api.DeviceActivation.t() | nil
        }

  defstruct [:device_activation]

  field :device_activation, 1, type: Api.DeviceActivation
end

defmodule Api.DeactivateDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.GetDeviceActivationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.GetDeviceActivationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_activation: Api.DeviceActivation.t() | nil
        }

  defstruct [:device_activation]

  field :device_activation, 1, type: Api.DeviceActivation
end

defmodule Api.GetRandomDevAddrRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.GetRandomDevAddrResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_addr: String.t()
        }

  defstruct [:dev_addr]

  field :dev_addr, 1, type: :string
end

defmodule Api.StreamDeviceFrameLogsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.StreamDeviceFrameLogsResponse do
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

defmodule Api.StreamDeviceEventLogsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.StreamDeviceEventLogsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: String.t(),
          payload_json: String.t()
        }

  defstruct [:type, :payload_json]

  field :type, 1, type: :string
  field :payload_json, 2, type: :string
end

defmodule Api.DeviceService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.DeviceService"

  rpc :Create, Api.CreateDeviceRequest, Google.Protobuf.Empty

  rpc :Get, Api.GetDeviceRequest, Api.GetDeviceResponse

  rpc :List, Api.ListDeviceRequest, Api.ListDeviceResponse

  rpc :Delete, Api.DeleteDeviceRequest, Google.Protobuf.Empty

  rpc :Update, Api.UpdateDeviceRequest, Google.Protobuf.Empty

  rpc :CreateKeys, Api.CreateDeviceKeysRequest, Google.Protobuf.Empty

  rpc :GetKeys, Api.GetDeviceKeysRequest, Api.GetDeviceKeysResponse

  rpc :UpdateKeys, Api.UpdateDeviceKeysRequest, Google.Protobuf.Empty

  rpc :DeleteKeys, Api.DeleteDeviceKeysRequest, Google.Protobuf.Empty

  rpc :Activate, Api.ActivateDeviceRequest, Google.Protobuf.Empty

  rpc :Deactivate, Api.DeactivateDeviceRequest, Google.Protobuf.Empty

  rpc :GetActivation, Api.GetDeviceActivationRequest, Api.GetDeviceActivationResponse

  rpc :GetRandomDevAddr, Api.GetRandomDevAddrRequest, Api.GetRandomDevAddrResponse

  rpc :StreamFrameLogs,
      Api.StreamDeviceFrameLogsRequest,
      stream(Api.StreamDeviceFrameLogsResponse)

  rpc :StreamEventLogs,
      Api.StreamDeviceEventLogsRequest,
      stream(Api.StreamDeviceEventLogsResponse)
end

defmodule Api.DeviceService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.DeviceService.Service
end
