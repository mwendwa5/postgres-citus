SELECT partition
  FROM time_partitions
 WHERE parent_table = 'transaction'::regclass;
