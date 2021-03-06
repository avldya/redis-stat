class RedisStat
  DEFAULT_TERM_WIDTH    = 180
  DEFAULT_TERM_HEIGHT   = 25
  DEFAULT_SERVER_PORT   = 63790

  MEASURES = {
    :static => [
      :redis_version,
      :redis_mode,
      :process_id,
      :uptime_in_seconds,
      :uptime_in_days,
      :role,
      :connected_slaves,
      :aof_enabled,
      [:rdb_bgsave_in_progress, :bgsave_in_progress],
      [:rdb_last_save_time, :last_save_time],
    ],
    :default => [
      :at,
      :used_cpu_user,
      :used_cpu_sys,
      :connected_clients,
      :blocked_clients,
      :used_memory,
      :used_memory_rss,
      :keys,
      :total_commands_processed_per_second,
      :expired_keys_per_second,
      :evicted_keys_per_second,
      :keyspace_hit_ratio_per_second,
      :keyspace_hits_per_second,
      :keyspace_misses_per_second,
      :aof_current_size,
    ],
    :verbose => [
      :at,
      :used_cpu_user,
      :used_cpu_sys,
      :connected_clients,
      :blocked_clients,
      :rejected_connections_per_second,
      :used_memory,
      :used_memory_rss,
      :mem_fragmentation_ratio,
      :keys,
      :total_commands_processed_per_second,
      :total_commands_processed,
      :expired_keys_per_second,
      :expired_keys,
      :evicted_keys_per_second,
      :evicted_keys,
      # :keyspace_hit_ratio,
      :keyspace_hit_ratio_per_second,
      :keyspace_hits_per_second,
      :keyspace_hits,
      :keyspace_misses_per_second,
      :keyspace_misses,
      :aof_current_size,
      :aof_base_size,
      [:rdb_changes_since_last_save, :changes_since_last_save],
      :pubsub_channels,
      :pubsub_patterns,
    ]
  }

  COLORS = {
    :at                                  => [:bold],
    :used_cpu_user                       => [:yellow, :bold],
    :used_cpu_sys                        => [:yellow],
    :connected_clients                   => [:cyan, :bold],
    :blocked_clients                     => [:cyan, :bold],
    :rejected_connections_per_second     => [:cyan],
    :used_memory                         => [:green],
    :used_memory_rss                     => [:green],
    :mem_fragmentation_ratio             => [:green],
    :keys                                => [:bold],
    :total_commands_processed            => [:blue, :bold],
    :total_commands_processed_per_second => [:blue, :bold],
    :expired_keys                        => [:red],
    :expired_keys_per_second             => [:red],
    :evicted_keys                        => [:red, :bold],
    :evicted_keys_per_second             => [:red, :bold],
    :keyspace_hits                       => [:magenta, :bold],
    :keyspace_hits_per_second            => [:magenta, :bold],
    :keyspace_misses                     => [:magenta],
    :keyspace_misses_per_second          => [:magenta],
    :keyspace_hit_ratio                  => [:magenta, :bold],
    :keyspace_hit_ratio_per_second       => [:magenta, :bold],
    :aof_current_size                    => [:cyan],
    :aof_base_size                       => [:cyan],
    :rdb_changes_since_last_save         => [:green, :bold],
    :pubsub_channels                     => [:cyan, :bold],
    :pubsub_patterns                     => [:cyan, :bold],
  }

  LABELS = {
    :at                                  => 'time',
    :used_cpu_user                       => 'us',
    :used_cpu_sys                        => 'sy',
    :connected_clients                   => 'cl',
    :blocked_clients                     => 'bcl',
    :rejected_connections_per_second     => 'rej/s',
    :used_memory                         => 'mem',
    :used_memory_rss                     => 'rss',
    :mem_fragmentation_ratio             => 'frag',
    :total_commands_processed            => 'cmd',
    :total_commands_processed_per_second => 'cmd/s',
    :expired_keys                        => 'exp',
    :expired_keys_per_second             => 'exp/s',
    :evicted_keys                        => 'evt',
    :evicted_keys_per_second             => 'evt/s',
    :keys                                => 'keys',
    :keyspace_hits                       => 'hit',
    :keyspace_hits_per_second            => 'hit/s',
    :keyspace_misses                     => 'mis',
    :keyspace_misses_per_second          => 'mis/s',
    :keyspace_hit_ratio                  => 'hit%',
    :keyspace_hit_ratio_per_second       => 'hit%/s',
    :aof_current_size                    => 'aofcs',
    :aof_base_size                       => 'aofbs',
    :rdb_changes_since_last_save         => 'chsv',
    :pubsub_channels                     => 'psch',
    :pubsub_patterns                     => 'psp',
  }

  TYPES = {
    :at                                  => :f,
    :used_cpu_user                       => :f,
    :used_cpu_sys                        => :f,
    :connected_clients                   => :i,
    :blocked_clients                     => :i,
    :rejected_connections                => :i,
    :rejected_connections_per_second     => :f,
    :used_memory                         => :i,
    :used_memory_rss                     => :i,
    :mem_fragmentation_ratio             => :f,
    :total_commands_processed            => :i,
    :total_commands_processed_per_second => :f,
    :expired_keys                        => :i,
    :expired_keys_per_second             => :f,
    :evicted_keys                        => :i,
    :evicted_keys_per_second             => :f,
    :keys                                => :i,
    :keyspace_hits                       => :i,
    :keyspace_hits_per_second            => :f,
    :keyspace_misses                     => :i,
    :keyspace_misses_per_second          => :f,
    :keyspace_hit_ratio                  => :i,
    :keyspace_hit_ratio_per_second       => :f,
    :aof_current_size                    => :i,
    :aof_base_size                       => :i,
    :changes_since_last_save             => :i,
    :rdb_changes_since_last_save         => :i,
    :pubsub_channels                     => :i,
    :pubsub_patterns                     => :i,

    :redis_version                       => :s,
    :redis_mode                          => :s,
    :process_id                          => :i,
    :uptime_in_seconds                   => :i,
    :uptime_in_days                      => :i,
    :role                                => :s,
    :connected_slaves                    => :i,
    :aof_enabled                         => :i,
    :rdb_bgsave_in_progress              => :i,
    :bgsave_in_progress                  => :i,
    :rdb_last_save_time                  => :i,
    :last_save_time                      => :i,
  }
end

