```
[adev4769@packer ~]$ gsutil cp yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz gs://yba-backup-bucket-001/
Copying file://yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz [Content-Type=application/x-tar]...
==> NOTE: You are uploading one or more large file(s), which would run  
significantly faster if you enable parallel composite uploads. This
feature can be enabled by editing the
"parallel_composite_upload_threshold" value in your .boto
configuration file. However, note that if you do this large files will
be uploaded as `composite objects
<https://cloud.google.com/storage/docs/composite-objects>`_,which
means that any user who downloads such objects will need to have a
compiled crcmod installed (see "gsutil help crcmod"). This is because
without a compiled crcmod, computing checksums on composite objects is
so slow that gsutil disables downloads of composite objects.

/ [1 files][  1.8 GiB/  1.8 GiB]                                
Operation completed over 1 objects/1.8 GiB.                      
[adev4769@packer ~]$ gsutil ls gs://yba-backup-bucket-001/
gs://yba-backup-bucket-001/yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz
[adev4769@packer ~]$ 
```

```
gsutil ls gs://yba-backup-bucket-001/
```

```
gsutil cp <path-to-tar-file> gs://yba-backup-bucket-001/

```

### Install the yba tar file and push that to gcs bucket

```
[adev4769@packer ~]$ wget https://downloads.yugabyte.com/releases/2024.2.4.0/yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz
--2026-02-11 14:27:15--  https://downloads.yugabyte.com/releases/2024.2.4.0/yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz
Resolving downloads.yugabyte.com (downloads.yugabyte.com)... 172.66.42.235, 172.66.41.21, 2606:4700:3108::ac42:2aeb, ...
Connecting to downloads.yugabyte.com (downloads.yugabyte.com)|172.66.42.235|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1972444832 (1.8G) [application/x-tar]
Saving to: ‘yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz’

yba_installer_full-2024.2.4.0-b89-linux-x86 100%[==========================================================================================>]   1.84G   134MB/s    in 16s   

2026-02-11 14:27:32 (114 MB/s) - ‘yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz’ saved [1972444832/1972444832]

[adev4769@packer ~]$ gsutil cp yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz gs://yba-bucket-001/
Copying file://yba_installer_full-2024.2.4.0-b89-linux-x86_64.tar.gz [Content-Type=application/x-tar]...
==> NOTE: You are uploading one or more large file(s), which would run  
significantly faster if you enable parallel composite uploads. This
feature can be enabled by editing the
"parallel_composite_upload_threshold" value in your .boto
configuration file. However, note that if you do this large files will
be uploaded as `composite objects
<https://cloud.google.com/storage/docs/composite-objects>`_,which
means that any user who downloads such objects will need to have a
compiled crcmod installed (see "gsutil help crcmod"). This is because
without a compiled crcmod, computing checksums on composite objects is
so slow that gsutil disables downloads of composite objects.

/ [1 files][  1.8 GiB/  1.8 GiB]  150.1 MiB/s   
Operation completed over 1 objects/1.8 GiB.  
[adev4769@packer ~]$ 
```

#### gcloud services enable cloudkms.googleapis.com  --project project-af758472-c239-4625-869

````
gcloud services enable cloudkms.googleapis.com \
  --project project-af758472-c239-4625-869
```
````

```
terraform import 'module.kms_keys["yba-db-key"].google_kms_key_ring.keyring' \
projects/project-af758472-c239-4625-869/locations/us-central1/keyRings/yba-keyring-prod
```

```

User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/GCP_Resources (main)
$ terraform import 'module.kms_keys["yba-db-key"].google_kms_key_ring.keyring' \
projects/project-af758472-c239-4625-869/locations/us-central1/keyRings/yba-keyring-prod
module.kms_keys["yba-db-key"].google_kms_key_ring.keyring: Importing from ID "projects/project-af758472-c239-4625-869/locations/us-central1/keyRings/yba-keyring-prod"...
module.kms_keys["yba-db-key"].google_kms_key_ring.keyring: Import prepared!
  Prepared google_kms_key_ring for import
module.kms_keys["yba-db-key"].google_kms_key_ring.keyring: Refreshing state... [id=projects/project-af758472-c239-4625-869/locations/us-central1/keyRings/yba-keyring-prod]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.


User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/GCP_Resources (main)
$

```

```
User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/Jenkins_Clusters (main)
$ gcloud compute instances list
NAME: jenkins-master
ZONE: us-central1-a
MACHINE_TYPE: n2-standard-2
PREEMPTIBLE:
INTERNAL_IP: 10.0.0.8
EXTERNAL_IP: 34.61.74.111
STATUS: RUNNING

NAME: jenkins-slave-1
ZONE: us-central1-a
MACHINE_TYPE: n2-standard-2
PREEMPTIBLE:
INTERNAL_IP: 10.0.0.6
EXTERNAL_IP: 34.42.33.190
STATUS: RUNNING

NAME: jenkins-slave-2
ZONE: us-central1-a
MACHINE_TYPE: n2-standard-2
PREEMPTIBLE:
INTERNAL_IP: 10.0.0.7
EXTERNAL_IP: 34.170.30.143
STATUS: RUNNING

User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/Jenkins_Clusters (main)

```

```
gcloud compute instances list
```



### Login to the Server / SSH to the Server

```

User@DESKTOP-KM01E29 MINGW64 ~
$ gcloud compute ssh jenkins-master --zone us-central1-a
```
