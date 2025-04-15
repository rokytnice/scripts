#!/bin/bash
ssh andrerochlitz@eigenheim.dev.isxris.stationservice.aws.db.de LocalForward 22099 wasa-frontend.team2:8080 LocalForward 22098 wasa-backend.team2:8080 LocalForward 22097 wasa-backend:8080 LocalForward 22096 wasa-backend.dev:8080 LocalForward 3128 webproxy.aws.db.de:8080 LocalForward 10389 ldap.infra:389 LocalForward 1888 sandbox-odos-qemu.sandbox:9022

