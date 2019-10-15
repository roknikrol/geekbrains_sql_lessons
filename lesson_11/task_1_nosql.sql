SET count 1
HSET ip_connections ip_address
HSET ip_connections connect_count count
INCR count