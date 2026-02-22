# yugabytedb-cloud-automation-gcp

End-to-end automation of YugabyteDB installation, configuration, cluster setup, and query execution using Terraform, Ansible, and Packer on GCP.

## Repo Structure

```
yugabytedb-end-to-end-automation/
│
├── packer/
│   ├── templates/
│   │   └── rhel-yugabyte.json
│   ├── scripts/
│   │   └── install-deps.sh
│   └── variables.pkr.hcl
│
├── terraform/
│   ├── modules/
│   │   ├── network/
│   │   ├── compute/
│   │   └── iam/
│   ├── envs/
│   │   ├── dev/
│   │   └── prod/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
│
├── ansible/
│   ├── inventories/
│   │   ├── dev.ini
│   │   └── prod.ini
│   ├── roles/
│   │   ├── yugabytedb/
│   │   └── common/
│   ├── playbooks/
│   │   └── yugabytedb.yml
│   └── ansible.cfg
│
├── jenkins/
│   └── Jenkinsfile
│
├── scripts/
│   └── run-queries.sh
│
├── docs/
│   └── architecture.md
│
├── README.md
└── LICENSE

```


### OS Login via SSH-KEY

```
User@DESKTOP-KM01E29 MINGW64 ~/yugabytedb-cloud-automation-gcp/terraform_gcp/Jenkins_Clusters (main)
$ gcloud compute ssh jenkins-master --zone us-central1-a

```
