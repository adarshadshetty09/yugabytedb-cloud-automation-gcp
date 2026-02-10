[root@yba1 yba-cli]# ls
yba_cli-2024.2.4.0-b89-darwin-amd64  yba_cli-2024.2.4.0-b89-darwin-arm64  yba_cli-2024.2.4.0-b89-linux-amd64  yba_cli-2024.2.4.0-b89-linux-arm64
[root@yba1 yba-cli]# cd yba_cli-2024.2.4.0-b89-linux-amd64/
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# ls
yba
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# pwd
/mnt/yba/software/2024.2.4.0-b89/yb-platform/yugaware/yba-cli/yba_cli-2024.2.4.0-b89-linux-amd64
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# ls -lart
total 25156
-rwxr-xr-x. 1 yugabyte yugabyte 25751150 Jul  4  2025 yba
drwxr-x---. 2 yugabyte yugabyte     4096 Feb 10 11:57 .
drwxr-x---. 6 yugabyte yugabyte     4096 Feb 10 11:57 ..
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]#

PATH = /mnt/yba/software/2024.2.4.0-b89/yb-platform/yugaware/yba-cli/yba_cli-2024.2.4.0-b89-linux-amd64

# --- 1. YBA Registration ---

./yba register
-f
-n admin
-e admin@gmail.com
-p 'Admin123$$$'
--environment dev
-H https://34.174.36.233:443

# --- 2. On-Prem Provider Setup ---

./yba provider onprem create
--name gcp-provider
--region region-name=south-asia
--zone zone-name=mum1::region-name=south-asia
--zone zone-name=del1::region-name=south-asia
--ssh-user ybaadmin
--ssh-keypair-name ybaadmin
--ssh-keypair-file-path /home/ybaadmin/.ssh/id_rsa

# --- 3. Define Instance Type (Instance type name corrected to 'db-node-type') ---

./yba provider onprem instance-type add
--name gcp-provider
--instance-type-name db-node-type
--num-cores 2
--mem-size 10
--volume mount-points=/mnt/yba-data::size=10::type=SSD

# --- 4. Add Node for Primary Universe (in zone mum1) ---

# NOTE: Instance type corrected to 'db-node-type'

./yba provider onprem node add
--name gcp-provider
--ip 11.0.0.11
--instance-type db-node-type
--region south-asia
--zone mum1
--node-name db-pr-node-1

# --- 5. Add Node for xCluster Universe (in zone del1) ---

# NOTE: Instance type corrected to 'db-node-type'

./yba provider onprem node add
--name gcp-provider
--ip 11.0.0.12
--instance-type db-node-type
--region south-asia
--zone del1
--node-name db-xcluster-node-1

# --- 6. Create Primary Universe: universe-pr ---

# IMPORTANT: Uses --custom-node-names to assign the db-pr-node-1

./yba universe create
--name universe-pr
--yb-db-version 2024.2.5.1-b1
--provider-code onprem
--provider-name gcp-provider
--replication-factor 1
--num-nodes 1
--regions south-asia
--instance-type db-node-type
--custom-node-names db-pr-node-1
--assign-public-ip=false
--enable-ysql=true
--enable-ycql=false
--enable-node-to-node-encrypt=false
--enable-client-to-node-encrypt=false
--master-gflags '{"fs_wal_dirs":"/mnt/yba-wal","log_dir":"/mnt/yba-shared","tmp_dir":"/mnt/yba-data/tmp"}'
--tserver-gflags '{"primary":{"fs_wal_dirs":"/mnt/yba-wal","log_dir":"/mnt/yba-shared","tmp_dir":"/mnt/yba-data/tmp"}}'
-H https://34.174.126.11:443

# --- 7. Create xCluster Universe: universe-xcluster ---

# IMPORTANT: Uses --custom-node-names to assign the db-xcluster-node-1

./yba universe create
--name universe-xcluster
--yb-db-version 2024.2.5.1-b1
--provider-code onprem
--provider-name gcp-provider
--replication-factor 1
--num-nodes 1
--regions south-asia
--instance-type db-node-type
--custom-node-names db-xcluster-node-1
--assign-public-ip=false
--enable-ysql=true
--enable-ycql=false
--enable-node-to-node-encrypt=false
--enable-client-to-node-encrypt=false
--master-gflags '{"fs_wal_dirs":"/mnt/yba-wal","log_dir":"/mnt/yba-shared","tmp_dir":"/mnt/yba-data/tmp"}'
--tserver-gflags '{"primary":{"fs_wal_dirs":"/mnt/yba-wal","log_dir":"/mnt/yba-shared","tmp_dir":"/mnt/yba-data/tmp"}}'
-H https://34.174.126.11:443

yba storage-config gcs create
--name gcs-backup-iam
--backup-location gs://ybabackupbuckettest
--use-gcp-iam
-H https://34.174.126.11:443

yba backup create
--universe-name universe-pr
--storage-config-name gcs-backup-iam
--table-type ysql
--time-before-delete-in-ms 86400000
-H https://34.174.36.233:443

# List tables in a universe that are eligible for xCluster

yba universe table list  --name universe-pr

yba xcluster create --name just-a-test
--source-universe-name universe-pr
--target-universe-name universe-xcluster
--config-type basic
--table-uuids 00004000-0000-3000-8000-000000004002
--storage-config-name gcs-backup-iam
--insecure

=======================================================================================================================

```
[root@yba1 yba_cli




-2024.2.4.0-b89-linux-amd64]# ls
yba
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# ./yba register \
  -f \
  -n admin \
  -e admin@gmail.com \
  -p 'Admin123$$$' \
  --environment dev \
  -H https://34.68.77.180:443

No config was found a new one will be created.

Configuration file '$HOME/.yba-cli.yaml' sucessfully updated.
Customer UUID                          API Token
9fe797d1-fac9-4283-9250-5ad41313bd72   3.dca68f91-820b-4b76-b0de-4c01d038c101.9621ae7f-2b7b-42ae-9250-837126df0073
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# 
```

```
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# ./yba provider onprem create \
  --name gcp-provider \
  --region region-name=south-asia \
  --zone zone-name=mum1::region-name=south-asia \
  --ssh-user ybaadmin \
  --ssh-keypair-name ybaadmin \
  --ssh-keypair-file-path /home/ybaadmin/.ssh/id_rsa
The provider gcp-provider (59b4cfd8-1f1e-4a4c-9e73-da59f11206ad) has been created
Name           Code      UUID                                   Regions      SSH User   SSH Port   Status
gcp-provider   onprem    59b4cfd8-1f1e-4a4c-9e73-da59f11206ad   south-asia   ybaadmin   22         Ready
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# 
```

```
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# ./yba provider onprem node add \
  --name gcp-provider \
  --ip 10.0.0.12 \
  --instance-type db-node-type \
  --region south-asia \
  --zone mum1 \
  --node-name db-pr-node-1
The node instance 10.0.0.12 has been added to provider gcp-provider (59b4cfd8-1f1e-4a4c-9e73-da59f11206ad)
IP          Node Name      Node UUID                              Region       Zone      Instance Type   Universe Name
10.0.0.12   db-pr-node-1   3c3e3aed-6919-4c98-8a94-499b1567b0ef   south-asia   mum1      db-node-type    Not Used
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# ./yba provider onprem node add   --name gcp-provider   --ip 10.0.0.13   --instance-type db-node-type   --regio
n south-asia   --zone mum1   --node-name db-pr-node-2
The node instance 10.0.0.13 has been added to provider gcp-provider (59b4cfd8-1f1e-4a4c-9e73-da59f11206ad)
IP          Node Name      Node UUID                              Region       Zone      Instance Type   Universe Name
10.0.0.13   db-pr-node-2   d103476e-c803-4660-b5eb-c7b0177c6531   south-asia   mum1      db-node-type    Not Used
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# ./yba provider onprem node add   --name gcp-provider   --ip 10.0.0.14   --instance-type db-node-type   --regio
n south-asia   --zone mum1   --node-name db-pr-node-3
The node instance 10.0.0.14 has been added to provider gcp-provider (59b4cfd8-1f1e-4a4c-9e73-da59f11206ad)
IP          Node Name      Node UUID                              Region       Zone      Instance Type   Universe Name
10.0.0.14   db-pr-node-3   c3d8c4e2-0d7c-4be7-97f1-6c2b4579a4af   south-asia   mum1      db-node-type    Not Used
[root@yba1 yba_cli-2024.2.4.0-b89-linux-amd64]# 
```
