#!/bin/bash

export RETARUS_NOTIFICATION_VERSION=$(grep \<ts.retarus.notification.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')
export WEBARZT_VERSION=$(grep \<ts.webarzt.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')
export TS_RESOURCES_VERSION=$(grep \<ts.resources.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')
export FHIR_SERVICE_VERSION=$(grep \<ts.fhir.service.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')
export FHIR_R4_VERSION=$(grep \<ts.fhir.r4.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')
export EVENTSTORAGE_VERSION=$(grep \<ts.eventstorage.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')
export WEBARZT_GUI_VERSION=$(grep \<ts.gui.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')
export WEBARZT_GUI2_VERSION=$(grep \<ts.gui2.version\> ../../ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $1}')

docker-compose -f ../docker-compose.yml down
