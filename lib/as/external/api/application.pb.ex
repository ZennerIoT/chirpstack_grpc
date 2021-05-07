defmodule Api.IntegrationKind do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :HTTP
          | :INFLUXDB
          | :THINGSBOARD
          | :MYDEVICES
          | :LORACLOUD
          | :GCP_PUBSUB
          | :AWS_SNS
          | :AZURE_SERVICE_BUS
          | :PILOT_THINGS
          | :MQTT_GLOBAL

  field :HTTP, 0

  field :INFLUXDB, 1

  field :THINGSBOARD, 2

  field :MYDEVICES, 3

  field :LORACLOUD, 4

  field :GCP_PUBSUB, 5

  field :AWS_SNS, 6

  field :AZURE_SERVICE_BUS, 7

  field :PILOT_THINGS, 8

  field :MQTT_GLOBAL, 9
end

defmodule Api.Marshaler do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :JSON | :PROTOBUF | :JSON_V3

  field :JSON, 0

  field :PROTOBUF, 1

  field :JSON_V3, 2
end

defmodule Api.InfluxDBPrecision do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :NS | :U | :MS | :S | :M | :H

  field :NS, 0

  field :U, 1

  field :MS, 2

  field :S, 3

  field :M, 4

  field :H, 5
end

defmodule Api.Application do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          description: String.t(),
          organization_id: integer,
          service_profile_id: String.t(),
          payload_codec: String.t(),
          payload_encoder_script: String.t(),
          payload_decoder_script: String.t()
        }

  defstruct [
    :id,
    :name,
    :description,
    :organization_id,
    :service_profile_id,
    :payload_codec,
    :payload_encoder_script,
    :payload_decoder_script
  ]

  field :id, 1, type: :int64
  field :name, 2, type: :string
  field :description, 3, type: :string
  field :organization_id, 4, type: :int64
  field :service_profile_id, 5, type: :string
  field :payload_codec, 6, type: :string
  field :payload_encoder_script, 7, type: :string
  field :payload_decoder_script, 8, type: :string
end

defmodule Api.ApplicationListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          description: String.t(),
          organization_id: integer,
          service_profile_id: String.t(),
          service_profile_name: String.t()
        }

  defstruct [
    :id,
    :name,
    :description,
    :organization_id,
    :service_profile_id,
    :service_profile_name
  ]

  field :id, 1, type: :int64
  field :name, 2, type: :string
  field :description, 3, type: :string
  field :organization_id, 4, type: :int64
  field :service_profile_id, 5, type: :string
  field :service_profile_name, 6, type: :string
end

defmodule Api.CreateApplicationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application: Api.Application.t() | nil
        }

  defstruct [:application]

  field :application, 1, type: Api.Application
end

defmodule Api.CreateApplicationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.GetApplicationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.GetApplicationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application: Api.Application.t() | nil
        }

  defstruct [:application]

  field :application, 1, type: Api.Application
end

defmodule Api.UpdateApplicationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application: Api.Application.t() | nil
        }

  defstruct [:application]

  field :application, 1, type: Api.Application
end

defmodule Api.DeleteApplicationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct [:id]

  field :id, 1, type: :int64
end

defmodule Api.ListApplicationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          organization_id: integer,
          search: String.t()
        }

  defstruct [:limit, :offset, :organization_id, :search]

  field :limit, 1, type: :int64
  field :offset, 2, type: :int64
  field :organization_id, 3, type: :int64
  field :search, 4, type: :string
end

defmodule Api.ListApplicationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.ApplicationListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.ApplicationListItem
end

defmodule Api.HTTPIntegrationHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Api.HTTPIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          headers: [Api.HTTPIntegrationHeader.t()],
          uplink_data_url: String.t(),
          join_notification_url: String.t(),
          ack_notification_url: String.t(),
          error_notification_url: String.t(),
          status_notification_url: String.t(),
          location_notification_url: String.t(),
          tx_ack_notification_url: String.t(),
          integration_notification_url: String.t(),
          marshaler: Api.Marshaler.t(),
          event_endpoint_url: String.t()
        }

  defstruct [
    :application_id,
    :headers,
    :uplink_data_url,
    :join_notification_url,
    :ack_notification_url,
    :error_notification_url,
    :status_notification_url,
    :location_notification_url,
    :tx_ack_notification_url,
    :integration_notification_url,
    :marshaler,
    :event_endpoint_url
  ]

  field :application_id, 1, type: :int64
  field :headers, 2, repeated: true, type: Api.HTTPIntegrationHeader
  field :uplink_data_url, 3, type: :string
  field :join_notification_url, 4, type: :string
  field :ack_notification_url, 5, type: :string
  field :error_notification_url, 6, type: :string
  field :status_notification_url, 7, type: :string
  field :location_notification_url, 8, type: :string
  field :tx_ack_notification_url, 9, type: :string
  field :integration_notification_url, 10, type: :string
  field :marshaler, 11, type: Api.Marshaler, enum: true
  field :event_endpoint_url, 12, type: :string
end

defmodule Api.CreateHTTPIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.HTTPIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.HTTPIntegration
end

defmodule Api.GetHTTPIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetHTTPIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.HTTPIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.HTTPIntegration
end

defmodule Api.UpdateHTTPIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.HTTPIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.HTTPIntegration
end

defmodule Api.DeleteHTTPIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.ListIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.IntegrationListItem do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          kind: Api.IntegrationKind.t()
        }

  defstruct [:kind]

  field :kind, 1, type: Api.IntegrationKind, enum: true
end

defmodule Api.ListIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_count: integer,
          result: [Api.IntegrationListItem.t()]
        }

  defstruct [:total_count, :result]

  field :total_count, 1, type: :int64
  field :result, 2, repeated: true, type: Api.IntegrationListItem
end

defmodule Api.InfluxDBIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          endpoint: String.t(),
          db: String.t(),
          username: String.t(),
          password: String.t(),
          retention_policy_name: String.t(),
          precision: Api.InfluxDBPrecision.t()
        }

  defstruct [
    :application_id,
    :endpoint,
    :db,
    :username,
    :password,
    :retention_policy_name,
    :precision
  ]

  field :application_id, 1, type: :int64
  field :endpoint, 2, type: :string
  field :db, 3, type: :string
  field :username, 4, type: :string
  field :password, 5, type: :string
  field :retention_policy_name, 6, type: :string
  field :precision, 7, type: Api.InfluxDBPrecision, enum: true
end

defmodule Api.CreateInfluxDBIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.InfluxDBIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.InfluxDBIntegration
end

defmodule Api.GetInfluxDBIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetInfluxDBIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.InfluxDBIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.InfluxDBIntegration
end

defmodule Api.UpdateInfluxDBIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.InfluxDBIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.InfluxDBIntegration
end

defmodule Api.DeleteInfluxDBIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.ThingsBoardIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          server: String.t()
        }

  defstruct [:application_id, :server]

  field :application_id, 1, type: :int64
  field :server, 2, type: :string
end

defmodule Api.CreateThingsBoardIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.ThingsBoardIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.ThingsBoardIntegration
end

defmodule Api.GetThingsBoardIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetThingsBoardIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.ThingsBoardIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.ThingsBoardIntegration
end

defmodule Api.UpdateThingsBoardIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.ThingsBoardIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.ThingsBoardIntegration
end

defmodule Api.DeleteThingsBoardIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.MyDevicesIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          endpoint: String.t()
        }

  defstruct [:application_id, :endpoint]

  field :application_id, 1, type: :int64
  field :endpoint, 2, type: :string
end

defmodule Api.CreateMyDevicesIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.MyDevicesIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.MyDevicesIntegration
end

defmodule Api.GetMyDevicesIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetMyDevicesIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.MyDevicesIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.MyDevicesIntegration
end

defmodule Api.UpdateMyDevicesIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.MyDevicesIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.MyDevicesIntegration
end

defmodule Api.DeleteMyDevicesIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.LoRaCloudIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          geolocation: boolean,
          geolocation_token: String.t(),
          geolocation_buffer_ttl: non_neg_integer,
          geolocation_min_buffer_size: non_neg_integer,
          geolocation_tdoa: boolean,
          geolocation_rssi: boolean,
          geolocation_gnss: boolean,
          geolocation_gnss_payload_field: String.t(),
          geolocation_gnss_use_rx_time: boolean,
          geolocation_wifi: boolean,
          geolocation_wifi_payload_field: String.t(),
          das: boolean,
          das_token: String.t(),
          das_modem_port: non_neg_integer,
          das_gnss_port: non_neg_integer,
          das_gnss_use_rx_time: boolean,
          das_streaming_geoloc_workaround: boolean
        }

  defstruct [
    :application_id,
    :geolocation,
    :geolocation_token,
    :geolocation_buffer_ttl,
    :geolocation_min_buffer_size,
    :geolocation_tdoa,
    :geolocation_rssi,
    :geolocation_gnss,
    :geolocation_gnss_payload_field,
    :geolocation_gnss_use_rx_time,
    :geolocation_wifi,
    :geolocation_wifi_payload_field,
    :das,
    :das_token,
    :das_modem_port,
    :das_gnss_port,
    :das_gnss_use_rx_time,
    :das_streaming_geoloc_workaround
  ]

  field :application_id, 1, type: :int64
  field :geolocation, 2, type: :bool
  field :geolocation_token, 3, type: :string
  field :geolocation_buffer_ttl, 4, type: :uint32
  field :geolocation_min_buffer_size, 5, type: :uint32
  field :geolocation_tdoa, 6, type: :bool
  field :geolocation_rssi, 7, type: :bool
  field :geolocation_gnss, 8, type: :bool
  field :geolocation_gnss_payload_field, 9, type: :string
  field :geolocation_gnss_use_rx_time, 10, type: :bool
  field :geolocation_wifi, 11, type: :bool
  field :geolocation_wifi_payload_field, 12, type: :string
  field :das, 13, type: :bool
  field :das_token, 14, type: :string
  field :das_modem_port, 15, type: :uint32
  field :das_gnss_port, 16, type: :uint32
  field :das_gnss_use_rx_time, 17, type: :bool
  field :das_streaming_geoloc_workaround, 18, type: :bool
end

defmodule Api.CreateLoRaCloudIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.LoRaCloudIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.LoRaCloudIntegration
end

defmodule Api.GetLoRaCloudIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetLoRaCloudIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.LoRaCloudIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.LoRaCloudIntegration
end

defmodule Api.UpdateLoRaCloudIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.LoRaCloudIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.LoRaCloudIntegration
end

defmodule Api.DeleteLoRaCloudIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GCPPubSubIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          marshaler: Api.Marshaler.t(),
          credentials_file: String.t(),
          project_id: String.t(),
          topic_name: String.t()
        }

  defstruct [:application_id, :marshaler, :credentials_file, :project_id, :topic_name]

  field :application_id, 1, type: :int64
  field :marshaler, 2, type: Api.Marshaler, enum: true
  field :credentials_file, 3, type: :string
  field :project_id, 4, type: :string
  field :topic_name, 5, type: :string
end

defmodule Api.CreateGCPPubSubIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.GCPPubSubIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.GCPPubSubIntegration
end

defmodule Api.GetGCPPubSubIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetGCPPubSubIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.GCPPubSubIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.GCPPubSubIntegration
end

defmodule Api.UpdateGCPPubSubIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.GCPPubSubIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.GCPPubSubIntegration
end

defmodule Api.DeleteGCPPubSubIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.AWSSNSIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          marshaler: Api.Marshaler.t(),
          region: String.t(),
          access_key_id: String.t(),
          secret_access_key: String.t(),
          topic_arn: String.t()
        }

  defstruct [:application_id, :marshaler, :region, :access_key_id, :secret_access_key, :topic_arn]

  field :application_id, 1, type: :int64
  field :marshaler, 2, type: Api.Marshaler, enum: true
  field :region, 3, type: :string
  field :access_key_id, 4, type: :string
  field :secret_access_key, 5, type: :string
  field :topic_arn, 6, type: :string
end

defmodule Api.CreateAWSSNSIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.AWSSNSIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.AWSSNSIntegration
end

defmodule Api.GetAWSSNSIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetAWSSNSIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.AWSSNSIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.AWSSNSIntegration
end

defmodule Api.UpdateAWSSNSIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.AWSSNSIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.AWSSNSIntegration
end

defmodule Api.DeleteAWSSNSIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.AzureServiceBusIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          marshaler: Api.Marshaler.t(),
          connection_string: String.t(),
          publish_name: String.t()
        }

  defstruct [:application_id, :marshaler, :connection_string, :publish_name]

  field :application_id, 1, type: :int64
  field :marshaler, 2, type: Api.Marshaler, enum: true
  field :connection_string, 3, type: :string
  field :publish_name, 4, type: :string
end

defmodule Api.CreateAzureServiceBusIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.AzureServiceBusIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.AzureServiceBusIntegration
end

defmodule Api.GetAzureServiceBusIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetAzureServiceBusIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.AzureServiceBusIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.AzureServiceBusIntegration
end

defmodule Api.UpdateAzureServiceBusIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.AzureServiceBusIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.AzureServiceBusIntegration
end

defmodule Api.DeleteAzureServiceBusIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.PilotThingsIntegration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer,
          server: String.t(),
          token: String.t()
        }

  defstruct [:application_id, :server, :token]

  field :application_id, 1, type: :int64
  field :server, 2, type: :string
  field :token, 3, type: :string
end

defmodule Api.CreatePilotThingsIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.PilotThingsIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.PilotThingsIntegration
end

defmodule Api.GetPilotThingsIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GetPilotThingsIntegrationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.PilotThingsIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.PilotThingsIntegration
end

defmodule Api.UpdatePilotThingsIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          integration: Api.PilotThingsIntegration.t() | nil
        }

  defstruct [:integration]

  field :integration, 1, type: Api.PilotThingsIntegration
end

defmodule Api.DeletePilotThingsIntegrationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GenerateMQTTIntegrationClientCertificateRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          application_id: integer
        }

  defstruct [:application_id]

  field :application_id, 1, type: :int64
end

defmodule Api.GenerateMQTTIntegrationClientCertificateResponse do
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

defmodule Api.ApplicationService.Service do
  @moduledoc false
  use GRPC.Service, name: "api.ApplicationService"

  rpc :Create, Api.CreateApplicationRequest, Api.CreateApplicationResponse

  rpc :Get, Api.GetApplicationRequest, Api.GetApplicationResponse

  rpc :Update, Api.UpdateApplicationRequest, Google.Protobuf.Empty

  rpc :Delete, Api.DeleteApplicationRequest, Google.Protobuf.Empty

  rpc :List, Api.ListApplicationRequest, Api.ListApplicationResponse

  rpc :CreateHTTPIntegration, Api.CreateHTTPIntegrationRequest, Google.Protobuf.Empty

  rpc :GetHTTPIntegration, Api.GetHTTPIntegrationRequest, Api.GetHTTPIntegrationResponse

  rpc :UpdateHTTPIntegration, Api.UpdateHTTPIntegrationRequest, Google.Protobuf.Empty

  rpc :DeleteHTTPIntegration, Api.DeleteHTTPIntegrationRequest, Google.Protobuf.Empty

  rpc :CreateInfluxDBIntegration, Api.CreateInfluxDBIntegrationRequest, Google.Protobuf.Empty

  rpc :GetInfluxDBIntegration,
      Api.GetInfluxDBIntegrationRequest,
      Api.GetInfluxDBIntegrationResponse

  rpc :UpdateInfluxDBIntegration, Api.UpdateInfluxDBIntegrationRequest, Google.Protobuf.Empty

  rpc :DeleteInfluxDBIntegration, Api.DeleteInfluxDBIntegrationRequest, Google.Protobuf.Empty

  rpc :CreateThingsBoardIntegration,
      Api.CreateThingsBoardIntegrationRequest,
      Google.Protobuf.Empty

  rpc :GetThingsBoardIntegration,
      Api.GetThingsBoardIntegrationRequest,
      Api.GetThingsBoardIntegrationResponse

  rpc :UpdateThingsBoardIntegration,
      Api.UpdateThingsBoardIntegrationRequest,
      Google.Protobuf.Empty

  rpc :DeleteThingsBoardIntegration,
      Api.DeleteThingsBoardIntegrationRequest,
      Google.Protobuf.Empty

  rpc :CreateMyDevicesIntegration, Api.CreateMyDevicesIntegrationRequest, Google.Protobuf.Empty

  rpc :GetMyDevicesIntegration,
      Api.GetMyDevicesIntegrationRequest,
      Api.GetMyDevicesIntegrationResponse

  rpc :UpdateMyDevicesIntegration, Api.UpdateMyDevicesIntegrationRequest, Google.Protobuf.Empty

  rpc :DeleteMyDevicesIntegration, Api.DeleteMyDevicesIntegrationRequest, Google.Protobuf.Empty

  rpc :CreateLoRaCloudIntegration, Api.CreateLoRaCloudIntegrationRequest, Google.Protobuf.Empty

  rpc :GetLoRaCloudIntegration,
      Api.GetLoRaCloudIntegrationRequest,
      Api.GetLoRaCloudIntegrationResponse

  rpc :UpdateLoRaCloudIntegration, Api.UpdateLoRaCloudIntegrationRequest, Google.Protobuf.Empty

  rpc :DeleteLoRaCloudIntegration, Api.DeleteLoRaCloudIntegrationRequest, Google.Protobuf.Empty

  rpc :CreateGCPPubSubIntegration, Api.CreateGCPPubSubIntegrationRequest, Google.Protobuf.Empty

  rpc :GetGCPPubSubIntegration,
      Api.GetGCPPubSubIntegrationRequest,
      Api.GetGCPPubSubIntegrationResponse

  rpc :UpdateGCPPubSubIntegration, Api.UpdateGCPPubSubIntegrationRequest, Google.Protobuf.Empty

  rpc :DeleteGCPPubSubIntegration, Api.DeleteGCPPubSubIntegrationRequest, Google.Protobuf.Empty

  rpc :CreateAWSSNSIntegration, Api.CreateAWSSNSIntegrationRequest, Google.Protobuf.Empty

  rpc :GetAWSSNSIntegration, Api.GetAWSSNSIntegrationRequest, Api.GetAWSSNSIntegrationResponse

  rpc :UpdateAWSSNSIntegration, Api.UpdateAWSSNSIntegrationRequest, Google.Protobuf.Empty

  rpc :DeleteAWSSNSIntegration, Api.DeleteAWSSNSIntegrationRequest, Google.Protobuf.Empty

  rpc :CreateAzureServiceBusIntegration,
      Api.CreateAzureServiceBusIntegrationRequest,
      Google.Protobuf.Empty

  rpc :GetAzureServiceBusIntegration,
      Api.GetAzureServiceBusIntegrationRequest,
      Api.GetAzureServiceBusIntegrationResponse

  rpc :UpdateAzureServiceBusIntegration,
      Api.UpdateAzureServiceBusIntegrationRequest,
      Google.Protobuf.Empty

  rpc :DeleteAzureServiceBusIntegration,
      Api.DeleteAzureServiceBusIntegrationRequest,
      Google.Protobuf.Empty

  rpc :CreatePilotThingsIntegration,
      Api.CreatePilotThingsIntegrationRequest,
      Google.Protobuf.Empty

  rpc :GetPilotThingsIntegration,
      Api.GetPilotThingsIntegrationRequest,
      Api.GetPilotThingsIntegrationResponse

  rpc :UpdatePilotThingsIntegration,
      Api.UpdatePilotThingsIntegrationRequest,
      Google.Protobuf.Empty

  rpc :DeletePilotThingsIntegration,
      Api.DeletePilotThingsIntegrationRequest,
      Google.Protobuf.Empty

  rpc :ListIntegrations, Api.ListIntegrationRequest, Api.ListIntegrationResponse

  rpc :GenerateMQTTIntegrationClientCertificate,
      Api.GenerateMQTTIntegrationClientCertificateRequest,
      Api.GenerateMQTTIntegrationClientCertificateResponse
end

defmodule Api.ApplicationService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Api.ApplicationService.Service
end
