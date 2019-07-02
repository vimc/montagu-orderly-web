## montagu-orderly-web

Configuration and support for using [OrderlyWeb](https://github.com/vimc/orderly-web) with [montagu](https://github.com/vimc/montagu)

### SSH keys for montagu-reports

1. Create a new ssh key with no password:

```
ssh-keygen -f ssh/id_rsa -q -N ""
```

2. Go to https://github.com/vimc/montagu-reports/settings/keys/new and copy in the public key (`cat ssh/id_rsa.pub`) - do not click "allow write access" as we only need read access
3. Add the keys to vault with

```
vault write secret/reports/deploy public=@ssh/id_rsa.pub private=@ssh/id_rsa
```

4. Remove the ssh keys with `rm -r ssh`
