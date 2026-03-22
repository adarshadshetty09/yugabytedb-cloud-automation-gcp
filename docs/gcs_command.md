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

### Normal Login

```

User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/GCP_Service_Account (main)
$ gcloud auth application-default login
Your browser has been opened to visit:

    https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=764086051850-6qr4p6gpi6hn506pt8ejuq83di341hur.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A8085%2F&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fsqlservice.login&state=ys8WKG8pR4QnR4QcmvuiK0AtAFNG9B&access_type=offline&code_challenge=hdJ7d1ErgOFHOK20Umui8QMPgytPgpil61K01TmZxpM&code_challenge_method=S256


Credentials saved to file: [C:\Users\User\AppData\Roaming\gcloud\application_default_credentials.json]

These credentials will be used by any library that requests Application Default Credentials (ADC).

Quota project "project-7b6bf38a-3ad2-4d2b-bdb" was added to ADC which can be used by Google client libraries for billing and quota. Note that some services may still bill the project owning the resource.

User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/GCP_Service_Account (main)
$ terraform apply  --auto-approve

```

```
User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/Network (main)
$ gcloud services enable iap.googleapis.com
Operation "operations/acat.p2-78743297843-581bcbfa-1d7f-4633-85bb-988b6422c345" finished successfully.
```

```
Microsoft Windows [Version 10.0.26200.8037]
(c) Microsoft Corporation. All rights reserved.

C:\Users\User>curl ifconfig.me
2401:4900:91d5:c613:6810:115d:135:d885
C:\Users\User>curl -4 ifconfig.me
223.237.161.59
C:\Users\User>curl ipv4.icanhazip.com
223.237.161.59

C:\Users\User>
```

```
[shettyanisha2004@ybdb1 ~]$ ss -tulnp
Netid            State              Recv-Q             Send-Q                         Local Address:Port                          Peer Address:Port            Process  
udp              UNCONN             0                  0                                  127.0.0.1:323                                0.0.0.0:*                      
udp              UNCONN             0                  0                                      [::1]:323                                   [::]:*                      
tcp              LISTEN             0                  128                                10.0.0.10:7000                               0.0.0.0:*                      
tcp              LISTEN             0                  128                                10.0.0.10:7100                               0.0.0.0:*                      
tcp              LISTEN             0                  4096                               10.0.0.10:15433                              0.0.0.0:*                      
tcp              LISTEN             0                  128                                10.0.0.10:12000                              0.0.0.0:*                      
tcp              LISTEN             0                  128                                10.0.0.10:9042                               0.0.0.0:*                      
tcp              LISTEN             0                  128                                10.0.0.10:9000                               0.0.0.0:*                      
tcp              LISTEN             0                  128                                10.0.0.10:9100                               0.0.0.0:*                      
tcp              LISTEN             0                  128                                10.0.0.10:13000                              0.0.0.0:*                      
tcp              LISTEN             0                  624                                10.0.0.10:5433                               0.0.0.0:*                      
tcp              LISTEN             0                  128                                  0.0.0.0:22                                 0.0.0.0:*                      
tcp              LISTEN             0                  128                                     [::]:22                                    [::]:*                      
[shettyanisha2004@ybdb1 ~]$ 
```

## 🔧 Add this inside `google_compute_instance`

```hcl
metadata = {
  enable-oslogin = "TRUE"
}
```

---

## Access to a monitor UI

```

gcloud compute ssh monitor1 \
--zone us-central1-a \
--project project-7b6bf38a-3ad2-4d2b-bdb \
--tunnel-through-iap
```

---

## ✅ Yugabyte UI

```bash
gcloud compute ssh monitor1 \
--zone us-central1-a \
--project project-7b6bf38a-3ad2-4d2b-bdb \
--tunnel-through-iap \
-- -L 15433:10.0.0.10:15433
```

Then open:

```text
http://localhost:15433
```

---

# 🧠 FINAL RESULT


| Feature   | Status        |
| --------- | ------------- |
| Public IP | ❌ Removed    |
| SSH       | IAP only      |
| DB        | Private       |
| UI        | Secure tunnel |
| Security  | 🏦 Enterprise |
