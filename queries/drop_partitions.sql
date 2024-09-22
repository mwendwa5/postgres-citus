SELECT cron.schedule('drop-partitions', '0 0 1 * *', $$
  CALL drop_old_time_partitions(
      'transaction',
      now() - interval '12 months' /* older_than */
  );
$$);
