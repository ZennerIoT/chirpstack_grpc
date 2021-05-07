defmodule Api.RXWindow do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :RX1 | :RX2

  field :RX1, 0

  field :RX2, 1
end

defmodule Api.UplinkFrameLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tx_info: Gw.UplinkTXInfo.t() | nil,
          rx_info: [Gw.UplinkRXInfo.t()],
          phy_payload_json: String.t()
        }

  defstruct [:tx_info, :rx_info, :phy_payload_json]

  field :tx_info, 1, type: Gw.UplinkTXInfo
  field :rx_info, 2, repeated: true, type: Gw.UplinkRXInfo
  field :phy_payload_json, 3, type: :string
end

defmodule Api.DownlinkFrameLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tx_info: Gw.DownlinkTXInfo.t() | nil,
          phy_payload_json: String.t(),
          gateway_id: String.t()
        }

  defstruct [:tx_info, :phy_payload_json, :gateway_id]

  field :tx_info, 1, type: Gw.DownlinkTXInfo
  field :phy_payload_json, 2, type: :string
  field :gateway_id, 3, type: :string
end
