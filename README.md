## Montagu Orderly Web
This repo contains the config and scripts needed to deploy Orderly Web as part of Montagu
 on UAT, Science and Production.
 
## Config
The base config `./config/orderly-web.yml` is shared by all instances. Instance specific config
is contained in a file `INSTANCE_NAME.yml`.

## Usage
The first time you deploy to a new instance, run `./setup INSTANCE_NAME` - the only instance names
currently supported are `uat`, `science` and `production`.

Then and for all subsequent deploys run `./start`.

## To deploy different versions 
By default `./start` will always pull and run the most recent docker images based on the configured tags.
For a quick rollback, or for testing purposes, you may wish to deploy specific versions of the orderly images.
To do so you can pass options to `./start` as follows:

    ./start --option web.image.tag=v1.1.0 --option orderly.image.tag=mrc-123
    
