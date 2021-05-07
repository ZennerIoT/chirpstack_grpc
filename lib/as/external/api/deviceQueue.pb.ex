defmodule Api.DeviceQueueItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t(),
          confirmed: boolean,
          f_cnt: non_neg_integer,
          f_port: non_neg_integer,
          data: binary,
          json_object: String.t()
        }

  defstruct [:dev_eui, :confirmed, :f_cnt, :f_port, :data, :json_object]

  field :dev_eui, 1, type: :string
  field :confirmed, 2, type: :bool
  field :f_cnt, 6, type: :uint32
  field :f_port, 3, type: :uint32
  field :data, 4, type: :bytes
  field :json_object, 5, type: :string
end

defmodule Api.EnqueueDeviceQueueItemRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_queue_item: Api.DeviceQueueItem.t() | nil
        }

  defstruct [:device_queue_item]

  field :device_queue_item, 1, type: Api.DeviceQueueItem
end

defmodule Api.EnqueueDeviceQueueItemResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          f_cnt: non_neg_integer
        }

  defstruct [:f_cnt]

  field :f_cnt, 1, type: :uint32
end

defmodule Api.FlushDeviceQueueRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t()
        }

  defstruct [:dev_eui]

  field :dev_eui, 1, type: :string
end

defmodule Api.ListDeviceQueueItemsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dev_eui: String.t(),
          count_only: boolean
        }

  defstruct [:dev_eui, :count_only]

  field :dev_eui, 1, type: :string
  field :count_only, 2, type: :bool
end

defmodule Api.ListDeviceQueueItemsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          device_queue_items: [Api.DeviceQueueItem.t()],
          total_count: non_neg_integer
        }

  defstruct [:device_queue_items, :total_count]

  field :device_queue_items, 1, repeated: true, type: Api.DeviceQueueItem
  field :total_count, 2, type: :uint32
end

defmodule Api.DeviceQueueService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.DeviceQueueService"

  rpc :Enqueue, Api.EnqueueDeviceQueueItemRequest, Api.EnqueueDeviceQueueItemResponse

  rpc :Flush, Api.FlushDeviceQueueRequest, Google.Protobuf.Empty

  rpc :List, Api.ListDeviceQueueItemsRequest, Api.ListDeviceQueueItemsResponse
end

defmodule Api.DeviceQueueService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.DeviceQueueService.Service
end
