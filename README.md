# oracle-cloud-demo

Demo of hosting a docker on oracle cloud (free)

Preview: [oracle.lhotak.net](oracle.lhotak.net)

Automated deployment via SSH host triggered by a commit containing `deploy`
```
docker-compose -f docker-compose.yaml up -d --build
```

TODO:
* https://github.com/marketplace/actions/run-an-oracle-cloud-infrastructure-oci-cli-command
* Terraform host setup
* dockerize nginx