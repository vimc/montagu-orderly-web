## montagu-orderly-web

Configuration and support for using [OrderlyWeb](https://github.com/vimc/orderly-web) with 
[montagu](https://github.com/vimc/montagu)

### Config
The base config `./config/orderly-web.yml` is shared by all instances. Instance specific config
is contained in a file `INSTANCE_NAME.yml`.

### Usage
The first time you deploy to a new instance, run `./setup INSTANCE_NAME` - the only instance names
currently supported are `uat`, `science` and `production`.

Then and for all subsequent deploys run `./start`.

### To deploy different versions 
By default `./start` will always pull and run the most recent docker images based on the configured tags.
For a quick rollback, or for testing purposes, you may wish to deploy specific versions of the orderly images.
To do so you can pass options to `./start` as follows:

    ./start --option web.image.tag=v1.1.0 --option orderly.image.tag=mrc-123
 
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

### Populating static documentation volume
The `documentation` folder contains scripts needed for populating the static documentation folder from a dropbox 
folder. 
Usage:
1. `./build.sh` - Builds a docker image and pushes it to the vimc private docker registry. Runs on TeamCity.
2. `./run <share_link>` - Takes a dropbox share link and populates a volume named `documents` with the contents of the 
 provided dropbox folder (by running the image created by 1.)
