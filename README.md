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
