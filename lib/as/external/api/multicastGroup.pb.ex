defmodule Api.MulticastGroupType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :CLASS_C | :CLASS_B

  field :CLASS_C, 0

  field :CLASS_B, 1
end

defmodule Api.MulticastGroup do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          mc_addr: String.t(),
          mc_nwk_s_key: String.t(),
          mc_app_s_key: String.t(),
          f_cnt: non_neg_integer,
          group_type: Api.MulticastGroupType.t(),
          dr: non_neg_integer,
          frequency: non_neg_integer,
          ping_slot_period: non_neg_integer,
          service_profile_id: String.t()
        }

  defstruct [
    :id,
    :name,
    :mc_addr,
    :mc_nwk_s_key,
    :mc_app_s_key,
    :f_cnt,
    :group_type,
    :dr,
    :frequency,
    :ping_slot_period,
    :service_profile_id
  ]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :mc_addr, 3, type: :string
  field :mc_nwk_s_key, 4, type: :string
  field :mc_app_s_key, 5, type: :string
  field :f_cnt, 6, type: :uint32
  field :group_type, 7, type: Api.MulticastGroupType, enum: true
  field :dr, 8, type: :uint32
  field :frequency, 9, type: :uint32
  field :ping_slot_period, 10, type: :uint32
  field :service_profile_id, 11, type: :string
end

defmodule Api.MulticastGroupListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          service_profile_id: String.t(),
          service_profile_name: String.t()
        }

  defstruct [:id, :name, :service_profile_id, :service_profile_name]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :service_profile_id, 3, type: :string
  field :service_profile_name, 4, type: :string
end

defmodule Api.CreateMulticastGroupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group: Api.MulticastGroup.t() | nil
        }

  defstruct [:multicast_group]

  field :multicast_group, 1, type: Api.MulticastGroup
end

defmodule Api.CreateMulticastGroupResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetMulticastGroupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.GetMulticastGroupResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group: Api.MulticastGroup.t() | nil,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:multicast_group, :created_at, :updated_at]

  field :multicast_group, 1, type: Api.MulticastGroup
  field :created_at, 2, type: Google.Protobuf.Timestamp
  field :updated_at, 3, type: Google.Protobuf.Timestamp
end

defmodule Api.UpdateMulticastGroupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group: Api.MulticastGroup.t() | nil
        }

  defstruct [:multicast_group]

  field :multicast_group, 1, type: Api.MulticastGroup
end

defmodule Api.DeleteMulticastGroupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.AddDeviceToMulticastGroupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group_id: String.t(),
          dev_eui: String.t()
        }

  defstruct [:multicast_group_id, :dev_eui]

  field :multicast_group_id, 1, type: :string
  field :dev_eui, 2, type: :string
end

defmodule Api.RemoveDeviceFromMulticastGroupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group_id: String.t(),
          dev_eui: String.t()
        }

  defstruct [:multicast_group_id, :dev_eui]

  field :multicast_group_id, 1, type: :string
  field :dev_eui, 2, type: :string
end

defmodule Api.ListMulticastGroupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          organization_id: integer,
          dev_eui: String.t(),
          service_profile_id: String.t(),
          search: String.t()
        }

  defstruct [:limit, :offset, :organization_id, :dev_eui, :service_profile_id, :search]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :organization_id, 3, type: :int64
  field :dev_eui, 4, type: :string
  field :service_profile_id, 5, type: :string
  field :search, 6, type: :string
end

defmodule Api.ListMulticastGroupResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.MulticastGroupListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.MulticastGroupListItem
end

defmodule Api.MulticastQueueItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group_id: String.t(),
          f_cnt: non_neg_integer,
          f_port: non_neg_integer,
          data: binary
        }

  defstruct [:multicast_group_id, :f_cnt, :f_port, :data]

  field :multicast_group_id, 1, type: :string
  field :f_cnt, 2, type: :uint32
  field :f_port, 3, type: :uint32
  field :data, 4, type: :bytes
end

defmodule Api.EnqueueMulticastQueueItemRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_queue_item: Api.MulticastQueueItem.t() | nil
        }

  defstruct [:multicast_queue_item]

  field :multicast_queue_item, 1, type: Api.MulticastQueueItem
end

defmodule Api.EnqueueMulticastQueueItemResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          f_cnt: non_neg_integer
        }

  defstruct [:f_cnt]

  field :f_cnt, 1, type: :uint32
end

defmodule Api.FlushMulticastGroupQueueItemsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group_id: String.t()
        }

  defstruct [:multicast_group_id]

  field :multicast_group_id, 1, type: :string
end

defmodule Api.ListMulticastGroupQueueItemsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_group_id: String.t()
        }

  defstruct [:multicast_group_id]

  field :multicast_group_id, 1, type: :string
end

defmodule Api.ListMulticastGroupQueueItemsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          multicast_queue_items: [Api.MulticastQueueItem.t()]
        }

  defstruct [:multicast_queue_items]

  field :multicast_queue_items, 1, repeated: true, type: Api.MulticastQueueItem
end

defmodule Api.MulticastGroupService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.MulticastGroupService"

  rpc :Create, Api.CreateMulticastGroupRequest, Api.CreateMulticastGroupResponse

  rpc :Get, Api.GetMulticastGroupRequest, Api.GetMulticastGroupResponse

  rpc :Update, Api.UpdateMulticastGroupRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteMulticastGroupRequest, Google.Protobuf.Empty

  rpc :List, Api.ListMulticastGroupRequest, Api.ListMulticastGroupResponse

  rpc :AddDevice, Api.AddDeviceToMulticastGroupRequest, Google.Protobuf.Empty

  rpc :RemoveDevice, Api.RemoveDeviceFromMulticastGroupRequest, Google.Protobuf.Empty

  rpc :Enqueue, Api.EnqueueMulticastQueueItemRequest, Api.EnqueueMulticastQueueItemResponse

  rpc :FlushQueue, Api.FlushMulticastGroupQueueItemsRequest, Google.Protobuf.Empty

  rpc :ListQueue,
      Api.ListMulticastGroupQueueItemsRequest,
      Api.ListMulticastGroupQueueItemsResponse
end

defmodule Api.MulticastGroupService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.MulticastGroupService.Service
end
