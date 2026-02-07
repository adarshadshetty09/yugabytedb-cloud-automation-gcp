# Install packer

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install packer
```



## For json

```
packer plugins install github.com/hashicorp/googlecompute
packer plugins list
packer plugins installed
packer build yba_2024.json
```
