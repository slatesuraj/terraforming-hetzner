[locust-master]
${locust_master_public_ips}

[locust-worker]
%{ for ip in locust_worker_public_ips ~}
${ip}
%{ endfor ~}
