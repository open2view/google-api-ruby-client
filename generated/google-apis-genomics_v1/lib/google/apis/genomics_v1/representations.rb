# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module GenomicsV1
      
      class Accelerator
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Action
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerKilledEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerStartedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerStoppedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DelayedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Disk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Event
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExistingDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FailedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Metadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Mount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NfsMount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Network
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PersistentDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Pipeline
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullStartedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PullStoppedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Resources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RunPipelineResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Secret
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnexpectedExitStatusEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VirtualMachine
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volume
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerAssignedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerReleasedEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Accelerator
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :type, as: 'type'
        end
      end
      
      class Action
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :commands, as: 'commands'
          property :credentials, as: 'credentials', class: Google::Apis::GenomicsV1::Secret, decorator: Google::Apis::GenomicsV1::Secret::Representation
      
          property :encrypted_environment, as: 'encryptedEnvironment', class: Google::Apis::GenomicsV1::Secret, decorator: Google::Apis::GenomicsV1::Secret::Representation
      
          property :entrypoint, as: 'entrypoint'
          hash :environment, as: 'environment'
          collection :flags, as: 'flags'
          property :image_uri, as: 'imageUri'
          hash :labels, as: 'labels'
          collection :mounts, as: 'mounts', class: Google::Apis::GenomicsV1::Mount, decorator: Google::Apis::GenomicsV1::Mount::Representation
      
          property :name, as: 'name'
          property :pid_namespace, as: 'pidNamespace'
          hash :port_mappings, as: 'portMappings'
          property :timeout, as: 'timeout'
        end
      end
      
      class ContainerKilledEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
        end
      end
      
      class ContainerStartedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :ip_address, as: 'ipAddress'
          hash :port_mappings, as: 'portMappings'
        end
      end
      
      class ContainerStoppedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :exit_status, as: 'exitStatus'
          property :stderr, as: 'stderr'
        end
      end
      
      class DelayedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cause, as: 'cause'
          collection :metrics, as: 'metrics'
        end
      end
      
      class Disk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :size_gb, as: 'sizeGb'
          property :source_image, as: 'sourceImage'
          property :type, as: 'type'
        end
      end
      
      class Event
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          hash :details, as: 'details'
          property :timestamp, as: 'timestamp'
        end
      end
      
      class ExistingDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk, as: 'disk'
        end
      end
      
      class FailedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cause, as: 'cause'
          property :code, as: 'code'
        end
      end
      
      class Metadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
          collection :events, as: 'events', class: Google::Apis::GenomicsV1::Event, decorator: Google::Apis::GenomicsV1::Event::Representation
      
          hash :labels, as: 'labels'
          property :pipeline, as: 'pipeline', class: Google::Apis::GenomicsV1::Pipeline, decorator: Google::Apis::GenomicsV1::Pipeline::Representation
      
          property :start_time, as: 'startTime'
        end
      end
      
      class Mount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk, as: 'disk'
          property :path, as: 'path'
          property :read_only, as: 'readOnly'
        end
      end
      
      class NfsMount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target, as: 'target'
        end
      end
      
      class Network
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :subnetwork, as: 'subnetwork'
          property :use_private_address, as: 'usePrivateAddress'
        end
      end
      
      class PersistentDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :size_gb, as: 'sizeGb'
          property :source_image, as: 'sourceImage'
          property :type, as: 'type'
        end
      end
      
      class Pipeline
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :actions, as: 'actions', class: Google::Apis::GenomicsV1::Action, decorator: Google::Apis::GenomicsV1::Action::Representation
      
          property :encrypted_environment, as: 'encryptedEnvironment', class: Google::Apis::GenomicsV1::Secret, decorator: Google::Apis::GenomicsV1::Secret::Representation
      
          hash :environment, as: 'environment'
          property :resources, as: 'resources', class: Google::Apis::GenomicsV1::Resources, decorator: Google::Apis::GenomicsV1::Resources::Representation
      
          property :timeout, as: 'timeout'
        end
      end
      
      class PullStartedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_uri, as: 'imageUri'
        end
      end
      
      class PullStoppedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_uri, as: 'imageUri'
        end
      end
      
      class Resources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
          collection :regions, as: 'regions'
          property :virtual_machine, as: 'virtualMachine', class: Google::Apis::GenomicsV1::VirtualMachine, decorator: Google::Apis::GenomicsV1::VirtualMachine::Representation
      
          collection :zones, as: 'zones'
        end
      end
      
      class RunPipelineResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Secret
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cipher_text, as: 'cipherText'
          property :key_name, as: 'keyName'
        end
      end
      
      class ServiceAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :scopes, as: 'scopes'
        end
      end
      
      class UnexpectedExitStatusEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :exit_status, as: 'exitStatus'
        end
      end
      
      class VirtualMachine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accelerators, as: 'accelerators', class: Google::Apis::GenomicsV1::Accelerator, decorator: Google::Apis::GenomicsV1::Accelerator::Representation
      
          property :boot_disk_size_gb, as: 'bootDiskSizeGb'
          property :boot_image, as: 'bootImage'
          property :cpu_platform, as: 'cpuPlatform'
          collection :disks, as: 'disks', class: Google::Apis::GenomicsV1::Disk, decorator: Google::Apis::GenomicsV1::Disk::Representation
      
          collection :docker_cache_images, as: 'dockerCacheImages'
          property :enable_stackdriver_monitoring, as: 'enableStackdriverMonitoring'
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :network, as: 'network', class: Google::Apis::GenomicsV1::Network, decorator: Google::Apis::GenomicsV1::Network::Representation
      
          property :nvidia_driver_version, as: 'nvidiaDriverVersion'
          property :preemptible, as: 'preemptible'
          property :service_account, as: 'serviceAccount', class: Google::Apis::GenomicsV1::ServiceAccount, decorator: Google::Apis::GenomicsV1::ServiceAccount::Representation
      
          collection :volumes, as: 'volumes', class: Google::Apis::GenomicsV1::Volume, decorator: Google::Apis::GenomicsV1::Volume::Representation
      
        end
      end
      
      class Volume
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :existing_disk, as: 'existingDisk', class: Google::Apis::GenomicsV1::ExistingDisk, decorator: Google::Apis::GenomicsV1::ExistingDisk::Representation
      
          property :nfs_mount, as: 'nfsMount', class: Google::Apis::GenomicsV1::NfsMount, decorator: Google::Apis::GenomicsV1::NfsMount::Representation
      
          property :persistent_disk, as: 'persistentDisk', class: Google::Apis::GenomicsV1::PersistentDisk, decorator: Google::Apis::GenomicsV1::PersistentDisk::Representation
      
          property :volume, as: 'volume'
        end
      end
      
      class WorkerAssignedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance'
          property :machine_type, as: 'machineType'
          property :zone, as: 'zone'
        end
      end
      
      class WorkerReleasedEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance'
          property :zone, as: 'zone'
        end
      end
    end
  end
end
