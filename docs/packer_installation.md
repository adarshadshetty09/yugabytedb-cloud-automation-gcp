# Install packer

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install packer
```

## For json

```
packer plugins install github.com/hashicorp/googlecompute
packer plugins install github.com/hashicorp/ansible
packer plugins list
packer plugins installed
packer build yba_2024.json
```

### Update the kms to a packer

```
 "kms_key_name": "projects/hbl-dev-et-blr-prj-spk-5a/locations/asia-south1/keyRings/mdm-dev-kr/cryptoKeys/mdm-dev-key"
```



### To execute the file

```
packer build --var-file=vars.json yba_2024_controller.json 
```
