defmodule Api.APIKey do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          is_admin: boolean,
          organization_id: integer,
          application_id: integer
        }

  defstruct [:id, :name, :is_admin, :organization_id, :application_id]

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :is_admin, 3, type: :bool
  field :organization_id, 4, type: :int64
  field :application_id, 5, type: :int64
end

defmodule Api.CreateAPIKeyRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          api_key: Api.APIKey.t() | nil
        }

  defstruct [:api_key]

  field :api_key, 1, type: Api.APIKey
end

defmodule Api.CreateAPIKeyResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          jwt_token: String.t()
        }

  defstruct [:id, :jwt_token]

  field :id, 1, type: :string
  field :jwt_token, 2, type: :string
end

defmodule Api.DeleteAPIKeyRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }

  defstruct [:id]

  field :id, 1, type: :string
end

defmodule Api.ListAPIKeysRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          is_admin: boolean,
          organization_id: integer,
          application_id: integer
        }

  defstruct [:limit, :offset, :is_admin, :organization_id, :application_id]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :is_admin, 3, type: :bool
  field :organization_id, 4, type: :int64
  field :application_id, 5, type: :int64
end

defmodule Api.ListAPIKeysResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.APIKey.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.APIKey
end

defmodule Api.OrganizationLink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer,
          organization_name: String.t(),
          is_admin: boolean,
          is_device_admin: boolean,
          is_gateway_admin: boolean,
          created_at: Google.Protobuf.Timestamp.t() | nil,
          updated_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [
    :organization_id,
    :organization_name,
    :is_admin,
    :is_device_admin,
    :is_gateway_admin,
    :created_at,
    :updated_at
  ]

  field :organization_id, 1, type: :int64
  field :organization_name, 2, type: :string
  field :is_admin, 3, type: :bool
  field :is_device_admin, 6, type: :bool
  field :is_gateway_admin, 7, type: :bool
  field :created_at, 4, type: Google.Protobuf.Timestamp
  field :updated_at, 5, type: Google.Protobuf.Timestamp
end

defmodule Api.LoginRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          email: String.t(),
          password: String.t()
        }

  defstruct [:email, :password]

  field :email, 1, type: :string
  field :password, 2, type: :string
end

defmodule Api.LoginResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          jwt: String.t()
        }

  defstruct [:jwt]

  field :jwt, 1, type: :string
end

defmodule Api.ProfileResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user: Api.User.t() | nil,
          organizations: [Api.OrganizationLink.t()]
        }

  defstruct [:user, :organizations]

  field :user, 1, type: Api.User
  field :organizations, 3, repeated: true, type: Api.OrganizationLink
end

defmodule Api.GlobalSearchRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          search: String.t(),
          limit: integer,
          offset: integer
        }

  defstruct [:search, :limit, :offset]

  field :search, 1, type: :string
  field :limit, 2, type: :int64
  field :offset, 3, type: :int64
end

defmodule Api.GlobalSearchResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: [Api.GlobalSearchResult.t()]
        }

  defstruct [:result]

  field :result, 1, repeated: true, type: Api.GlobalSearchResult
end

defmodule Api.GlobalSearchResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          kind: String.t(),
          score: float | :infinity | :negative_infinity | :nan,
          organization_id: integer,
          organization_name: String.t(),
          application_id: integer,
          application_name: String.t(),
          device_dev_eui: String.t(),
          device_name: String.t(),
          gateway_mac: String.t(),
          gateway_name: String.t()
        }

  defstruct [
    :kind,
    :score,
    :organization_id,
    :organization_name,
    :application_id,
    :application_name,
    :device_dev_eui,
    :device_name,
    :gateway_mac,
    :gateway_name
  ]

  field :kind, 1, type: :string
  field :score, 2, type: :float
  field :organization_id, 3, type: :int64
  field :organization_name, 4, type: :string
  field :application_id, 5, type: :int64
  field :application_name, 6, type: :string
  field :device_dev_eui, 7, type: :string
  field :device_name, 8, type: :string
  field :gateway_mac, 9, type: :string
  field :gateway_name, 10, type: :string
end

defmodule Api.SettingsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          branding: Api.Branding.t() | nil,
          openid_connect: Api.OpenIDConnect.t() | nil
        }

  defstruct [:branding, :openid_connect]

  field :branding, 2, type: Api.Branding
  field :openid_connect, 3, type: Api.OpenIDConnect
end

defmodule Api.Branding do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          registration: String.t(),
          footer: String.t()
        }

  defstruct [:registration, :footer]

  field :registration, 1, type: :string
  field :footer, 2, type: :string
end

defmodule Api.OpenIDConnect do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          enabled: boolean,
          login_url: String.t(),
          login_label: String.t(),
          logout_url: String.t()
        }

  defstruct [:enabled, :login_url, :login_label, :logout_url]

  field :enabled, 1, type: :bool
  field :login_url, 2, type: :string
  field :login_label, 3, type: :string
  field :logout_url, 4, type: :string
end

defmodule Api.OpenIDConnectLoginRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: String.t(),
          state: String.t()
        }

  defstruct [:code, :state]

  field :code, 1, type: :string
  field :state, 2, type: :string
end

defmodule Api.OpenIDConnectLoginResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          jwt_token: String.t()
        }

  defstruct [:jwt_token]

  field :jwt_token, 1, type: :string
end

defmodule Api.GetDevicesSummaryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer
        }

  defstruct [:organization_id]

  field :organization_id, 1, type: :int64
end

defmodule Api.GetDevicesSummaryResponse.DrCountEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: non_neg_integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :uint32
  field :value, 2, type: :uint32
end

defmodule Api.GetDevicesSummaryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          active_count: non_neg_integer,
          inactive_count: non_neg_integer,
          dr_count: %{non_neg_integer => non_neg_integer},
          never_seen_count: non_neg_integer
        }

  defstruct [:active_count, :inactive_count, :dr_count, :never_seen_count]

  field :active_count, 1, type: :uint32
  field :inactive_count, 2, type: :uint32
  field :dr_count, 3, repeated: true, type: Api.GetDevicesSummaryResponse.DrCountEntry, map: true
  field :never_seen_count, 4, type: :uint32
end

defmodule Api.GetGatewaysSummaryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          organization_id: integer
        }

  defstruct [:organization_id]

  field :organization_id, 1, type: :int64
end

defmodule Api.GetGatewaysSummaryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          active_count: non_neg_integer,
          inactive_count: non_neg_integer,
          never_seen_count: non_neg_integer
        }

  defstruct [:active_count, :inactive_count, :never_seen_count]

  field :active_count, 1, type: :uint32
  field :inactive_count, 2, type: :uint32
  field :never_seen_count, 3, type: :uint32
end

defmodule Api.InternalService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.InternalService"

  rpc :Login, Api.LoginRequest, Api.LoginResponse

  rpc :Profile, Google.Protobuf.Empty, Api.ProfileResponse

  rpc :GlobalSearch, Api.GlobalSearchRequest, Api.GlobalSearchResponse

  rpc :CreateAPIKey, Api.CreateAPIKeyRequest, Api.CreateAPIKeyResponse

  rpc :DeleteAPIKey, Api.DeleteAPIKeyRequest, Google.Protobuf.Empty

  rpc :ListAPIKeys, Api.ListAPIKeysRequest, Api.ListAPIKeysResponse

  rpc :Settings, Google.Protobuf.Empty, Api.SettingsResponse

  rpc :OpenIDConnectLogin, Api.OpenIDConnectLoginRequest, Api.OpenIDConnectLoginResponse

  rpc :GetDevicesSummary, Api.GetDevicesSummaryRequest, Api.GetDevicesSummaryResponse

  rpc :GetGatewaysSummary, Api.GetGatewaysSummaryRequest, Api.GetGatewaysSummaryResponse
end

defmodule Api.InternalService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.InternalService.Service
end
