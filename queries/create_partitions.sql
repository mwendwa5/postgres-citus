SELECT cron.schedule('create-partitions', '0 0 1 * *', $$
  SELECT create_time_partitions(
      table_name         := 'transaction',
      partition_interval := '1 month',
      end_at             := now() + '12 months'
  )
$$);
