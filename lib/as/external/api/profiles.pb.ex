defmodule Api.RatePolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :DROP | :MARK

  field :DROP, 0

  field :MARK, 1
end

defmodule Api.ServiceProfile do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          organization_id: integer,
          network_server_id: integer,
          ul_rate: non_neg_integer,
          ul_bucket_size: non_neg_integer,
          ul_rate_policy: Api.RatePolicy.t(),
          dl_rate: non_neg_integer,
          dl_bucket_size: non_neg_integer,
          dl_rate_policy: Api.RatePolicy.t(),
          add_gw_metadata: boolean,
          dev_status_req_freq: non_neg_integer,
          report_dev_status_battery: boolean,
          report_dev_status_margin: boolean,
          dr_min: non_neg_integer,
          dr_max: non_neg_integer,
          channel_mask: binary,
          pr_allowed: boolean,
          hr_allowed: boolean,
          ra_allowed: boolean,
          nwk_geo_loc: boolean,
          target_per: non_neg_integer,
          min_gw_diversity: non_neg_integer,
          gws_private: boolean
        }

  defstruct [
    :id,
    :name,
    :organization_id,
    :network_server_id,
    :ul_rate,
    :ul_bucket_size,
    :ul_rate_policy,
    :dl_rate,
    :dl_bucket_size,
    :dl_rate_policy,
    :add_gw_metadata,
    :dev_status_req_freq,
    :report_dev_status_battery,
    :report_dev_status_margin,
    :dr_min,
    :dr_max,
    :channel_mask,
    :pr_allowed,
    :hr_allowed,
    :ra_allowed,
    :nwk_geo_loc,
    :target_per,
    :min_gw_diversity,
    :gws_private
  ]

  field :id, 1, type: :string
  field :name, 21, type: :string
  field :organization_id, 22, type: :int64
  field :network_server_id, 23, type: :int64
  field :ul_rate, 2, type: :uint32
  field :ul_bucket_size, 3, type: :uint32
  field :ul_rate_policy, 4, type: Api.RatePolicy, enum: true
  field :dl_rate, 5, type: :uint32
  field :dl_bucket_size, 6, type: :uint32
  field :dl_rate_policy, 7, type: Api.RatePolicy, enum: true
  field :add_gw_metadata, 8, type: :bool
  field :dev_status_req_freq, 9, type: :uint32
  field :report_dev_status_battery, 10, type: :bool
  field :report_dev_status_margin, 11, type: :bool
  field :dr_min, 12, type: :uint32
  field :dr_max, 13, type: :uint32
  field :channel_mask, 14, type: :bytes
  field :pr_allowed, 15, type: :bool
  field :hr_allowed, 16, type: :bool
  field :ra_allowed, 17, type: :bool
  field :nwk_geo_loc, 18, type: :bool
  field :target_per, 19, type: :uint32
  field :min_gw_diversity, 20, type: :uint32
  field :gws_private, 24, type: :bool
end

defmodule Api.DeviceProfile.TagsEntry do
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

defmodule Api.DeviceProfile do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          organization_id: integer,
          network_server_id: integer,
          supports_class_b: boolean,
          class_b_timeout: non_neg_integer,
          ping_slot_period: non_neg_integer,
          ping_slot_dr: non_neg_integer,
          ping_slot_freq: non_neg_integer,
          supports_class_c: boolean,
          class_c_timeout: non_neg_integer,
          mac_version: String.t(),
          reg_params_revision: String.t(),
          rx_delay_1: non_neg_integer,
          rx_dr_offset_1: non_neg_integer,
          rx_datarate_2: non_neg_integer,
          rx_freq_2: non_neg_integer,
          factory_preset_freqs: [non_neg_integer],
          max_eirp: non_neg_integer,
          max_duty_cycle: non_neg_integer,
          supports_join: boolean,
          rf_region: String.t(),
          supports_32bit_f_cnt: boolean,
          payload_codec: String.t(),
          payload_encoder_script: String.t(),
          payload_decoder_script: String.t(),
          geoloc_buffer_ttl: non_neg_integer,
          geoloc_min_buffer_size: non_neg_integer,
          tags: %{String.t() => String.t()},
          uplink_interval: Google.Protobuf.Duration.t() | nil,
          adr_algorithm_id: String.t()
        }

  defstruct [
    :id,
    :name,
    :organization_id,
    :network_server_id,
    :supports_class_b,
    :class_b_timeout,
    :ping_slot_period,
    :ping_slot_dr,
    :ping_slot_freq,
    :supports_class_c,
    :class_c_timeout,
    :mac_version,
    :reg_params_revision,
    :rx_delay_1,
    :rx_dr_offset_1,
    :rx_datarate_2,
    :rx_freq_2,
    :factory_preset_freqs,
    :max_eirp,
    :max_duty_cycle,
    :supports_join,
    :rf_region,
    :supports_32bit_f_cnt,
    :payload_codec,
    :payload_encoder_script,
    :payload_decoder_script,
    :geoloc_buffer_ttl,
    :geoloc_min_buffer_size,
    :tags,
    :uplink_interval,
    :adr_algorithm_id
  ]

  field :id, 1, type: :string
  field :name, 21, type: :string
  field :organization_id, 22, type: :int64
  field :network_server_id, 23, type: :int64
  field :supports_class_b, 2, type: :bool
  field :class_b_timeout, 3, type: :uint32
  field :ping_slot_period, 4, type: :uint32
  field :ping_slot_dr, 5, type: :uint32
  field :ping_slot_freq, 6, type: :uint32
  field :supports_class_c, 7, type: :bool
  field :class_c_timeout, 8, type: :uint32
  field :mac_version, 9, type: :string
  field :reg_params_revision, 10, type: :string
  field :rx_delay_1, 11, type: :uint32
  field :rx_dr_offset_1, 12, type: :uint32
  field :rx_datarate_2, 13, type: :uint32
  field :rx_freq_2, 14, type: :uint32
  field :factory_preset_freqs, 15, repeated: true, type: :uint32
  field :max_eirp, 16, type: :uint32
  field :max_duty_cycle, 17, type: :uint32
  field :supports_join, 18, type: :bool
  field :rf_region, 19, type: :string
  field :supports_32bit_f_cnt, 20, type: :bool
  field :payload_codec, 24, type: :string
  field :payload_encoder_script, 25, type: :string
  field :payload_decoder_script, 26, type: :string
  field :geoloc_buffer_ttl, 27, type: :uint32
  field :geoloc_min_buffer_size, 28, type: :uint32
  field :tags, 29, repeated: true, type: Api.DeviceProfile.TagsEntry, map: true
  field :uplink_interval, 30, type: Google.Protobuf.Duration
  field :adr_algorithm_id, 31, type: :string
end
