#!/bin/bash


protoc -I=proto_defs/protobuf -I=proto_defs/protobuf/as/integration --elixir_out=plugins=grpc,paths=source_relative:lib/ as/as.proto
protoc -I=proto_defs/protobuf -I=proto_defs/protobuf/as/integration --elixir_out=plugins=grpc,paths=source_relative:lib/ as/integration/integration.proto

protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/application.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/frameLog.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/device.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/deviceProfile.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/deviceQueue.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/gateway.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/gatewayProfile.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/internal.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/multicastGroup.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/networkServer.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/organization.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/profiles.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/serviceProfile.proto
protoc -I=./googleapis -I=proto_defs/protobuf -I=proto_defs/protobuf/as/external/api --elixir_out=plugins=grpc,paths=source_relative:lib/ as/external/api/user.proto