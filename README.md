# FEGA CWL upload workflow

## Configure TESK for this:

 * Use the image:
```
eu.gcr.io/tes-wes/tesk-api:extra_secrets
```

 * Add a secret:
```
$ oc get secrets secretos -o yaml
apiVersion: v1
data:
  ega_key.c4gh.pub: XXX
  lftp.txt: XXX
  sftpkeypassword: XXX
  sftppassword: XXX
  testcineca.sk: XXX
kind: Secret
metadata:
  name: secretos
type: Opaque
```

 * Add the environment variable:
```
TESK_API_TASKMASTER_EXECUTOR_SECRET_NAME=secretos
```

 * Change the tag of the Taskmaster image:

```
TESK_API_TASKMASTER_IMAGE_VERSION=extra_secrets
```
