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
