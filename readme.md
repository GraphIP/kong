# Customised Kong Docker Image

This dockerfile takes an existing Kong image and adds custom plugins to it. Built using [docker-kong/customize/](https://github.com/Kong/docker-kong/tree/master/customize)

## Features

- ✅ [kong-plugin-moesif](https://github.com/Moesif/kong-plugin-moesif). The [Moesif Kong plugin](https://docs.konghq.com/hub/moesif/kong-plugin-moesif/) captures API traffic from [Kong API Gateway](https://getkong.org)
and logs it to [Moesif API Analytics](https://www.moesif.com).
- ✅ [Cloud SQL Proxy](https://github.com/GoogleCloudPlatform/cloudsql-proxy). Cloud SQL Proxy allows a user with the appropriate permissions to connect to a Second Generation Google Cloud SQL database without having to deal with IP whitelisting or SSL certificates manually.


# Supported tags

-   `1.6-alpine`, `latest (1.6-alpine)`

# Quick reference

-	**Where to get help**:
	[the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack/), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

-	**Where to file issues**:
	[https://github.com/graphip/kong/issues](https://github.com/graphip/kong/issues)

-	**Maintained by**:
	[Colin Wilson](https://github.com/colinwilson)