class AWS
  module Elasticache
    module Formats

      BASIC = {
        'ResponseMetadata' => {'RequestId' => String}
      }

      # Cache Security Groups
      SECURITY_GROUP = {
        'EC2SecurityGroups'       => Array,
        'CacheSecurityGroupName'  => String,
        'Description'             => String,
        'OwnerId'                 => String,
      }
      SINGLE_SECURITY_GROUP = BASIC.merge('CacheSecurityGroup' => SECURITY_GROUP)
      DESCRIBE_SECURITY_GROUPS = BASIC.merge('CacheSecurityGroups' => [SECURITY_GROUP])

      # Cache Clusters - more parameters get added as the lifecycle progresses
      CACHE_CLUSTER = {
        'AutoMinorVersionUpgrade'     => String,  # actually TrueClass or FalseClass
        'CacheSecurityGroups'         => Array,
        'CacheClusterId'              => String,
        'CacheClusterStatus'          => String,
        'CacheNodeType'               => String,
        'Engine'                      => String,
        'EngineVersion'               => String,
        'CacheParameterGroup'         => Hash,
        'NumCacheNodes'               => Integer,
        'PreferredMaintenanceWindow'  => String,
      }
      CACHE_CLUSTER_RUNNING   = CACHE_CLUSTER.merge(
        'CacheClusterCreateTime'      => DateTime,
        'PreferredAvailabilityZone'   => String,
        'CacheNodes'                  => Array
      )
      CACHE_CLUSTER_MODIFIED  = CACHE_CLUSTER_RUNNING.merge(
        'NotificationConfiguration'   => Hash,
        'PendingModifiedValues'       => Hash
      )
      SINGLE_CACHE_CLUSTER    = BASIC.merge('CacheCluster' => CACHE_CLUSTER)
      DESCRIBE_CACHE_CLUSTERS = BASIC.merge('CacheClusters' => [CACHE_CLUSTER])
    end
  end
end
