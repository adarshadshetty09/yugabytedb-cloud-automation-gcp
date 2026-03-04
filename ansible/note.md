ansible-project/
│
├── inventories/
│   ├── dev/
│   │   ├── hosts
│   │   └── group_vars
│   │       └── all.yml
│   │
│   ├── staging/
│   │   ├── hosts
│   │   └── group_vars
│   │       └── all.yml
│   │
│   └── prod/
│       ├── hosts
│       └── group_vars
│           └── all.yml
│
├── roles/
│   ├── common/
│   ├── docker/
│   ├── nginx/
│   ├── mysql/
│   └── app/
│
├── playbooks/
│   ├── site.yml
│   ├── webservers.yml
│   └── database.yml
│
├── group_vars/
│   └── all.yml
│
├── host_vars/
│
├── ansible.cfg
└── requirements.yml
