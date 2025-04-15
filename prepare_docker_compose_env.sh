#!/bin/bash
echo ""
echo ""
echo "██╗  ██╗██╗   ██╗   ██████╗ ██╗ ██████╗ ██╗████████╗ █████╗ ██╗         ██╗    ██╗███████╗██████╗  █████╗ ██████╗ ███████╗████████╗"
echo "██║ ██╔╝██║   ██║   ██╔══██╗██║██╔════╝ ██║╚══██╔══╝██╔══██╗██║         ██║    ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗╚══███╔╝╚══██╔══╝ "
echo "█████╔╝ ██║   ██║   ██║  ██║██║██║  ███╗██║   ██║   ███████║██║         ██║ █╗ ██║█████╗  ██████╔╝███████║██████╔╝  ███╔╝    ██║    "
echo "██╔═██╗ ╚██╗ ██╔╝   ██║  ██║██║██║   ██║██║   ██║   ██╔══██║██║         ██║███╗██║██╔══╝  ██╔══██╗██╔══██║██╔══██╗ ███╔╝     ██║     "
echo "██║  ██╗ ╚████╔╝ ██╗██████╔╝██║╚██████╔╝██║   ██║   ██║  ██║███████╗    ╚███╔███╔╝███████╗██████╔╝██║  ██║██║  ██║███████╗   ██║      "
echo "╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═════╝ ╚═╝ ╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝     ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝      "
echo ""
echo "██████╗ ███████╗██████╗ ███████╗██████╗ ██╗      ██████╗ ██╗   ██╗    ██████╗  ██████╗  ██████╗██╗  ██╗███████╗██████╗      "
echo "██╔══██╗██╔════╝██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗╚██╗ ██╔╝    ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗    "
echo "██████╔╝█████╗  ██║  ██║█████╗  ██████╔╝██║     ██║   ██║ ╚████╔╝     ██║  ██║██║   ██║██║     █████╔╝ █████╗  ██████╔╝   "
echo "██╔══██╗██╔══╝  ██║  ██║██╔══╝  ██╔═══╝ ██║     ██║   ██║  ╚██╔╝      ██║  ██║██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗  "
echo "██║  ██║███████╗██████╔╝███████╗██║     ███████╗╚██████╔╝   ██║       ██████╔╝╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║ "
echo "╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝     ╚══════╝ ╚═════╝    ╚═╝       ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
echo ""
echo ""




# Pfad-Parameter überprüfen zu ts.bundle.arzt

## Prüfe, ob das richitge Verzeichnis übergeben wurde
if [ -z "$1" ]; then
    echo "Kein Parameter übergeben. Setze Standardwert."
    root_path="/home/andre/IdeaProjects/ts.bundle.arzt"
else
    root_path="$1"
fi

reqsubstr="ts.bundle.arzt"

if [ -z "${root_path##*$reqsubstr*}" ] ;then
   echo "String '$root_path' contain substring: '$reqsubstr'.";
 else
   echo "[ERROR] Der Parameter muss eine Pfad zu ts.bundle.arzt sein."
fi

# Prüfe, ob das Verzeichnis existiert
if [ -d "$root_path" ]; then
    echo "Das Verzeichnis $root_path existiert."
else
    echo "Das Verzeichnis  $root_path existiert nicht."
    exit 1
fi

#Version in variablen übenrehmen
export WEBARZT_VERSION=$(grep -oPm1 "(?<=<version>).*?(?=</version>)" $root_path/ts.webarzt/pom.xml)
export RETARUS_NOTIFICATION_VERSION=$(grep \<ts.retarus.notification.version\> $root_path/ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $root_path}')
export TS_RESOURCES_VERSION=$(grep \<ts.resources.version\> $root_path/ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $root_path}')
export FHIR_SERVICE_VERSION=$(grep \<ts.fhir.service.version\> $root_path/ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $root_path}')
export FHIR_R4_VERSION=$(grep \<ts.fhir.r4.version\> $root_path/ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $root_path}')
export EVENTSTORAGE_VERSION=$(grep \<ts.eventstorage.version\> $root_path/ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $root_path}')
export WEBARZT_GUI_VERSION=$(grep \<ts.gui.version\> $root_path/ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $root_path}')
export WEBARZT_GUI2_VERSION=$(grep \<ts.gui2.version\> $root_path/ts.parent.arzt/pom.xml | awk -F\> '{print $2}' | awk -F\< '{print $root_path}')

#export WEBARZT_VERSION= $WEBARZT_VERSION=| tr '[:upper:]' '[:lower:]'

echo "export $RETARUS_NOTIFICATION_VERSION"
echo "export $WEBARZT_VERSION"
echo "export $TS_RESOURCES_VERSION"
echo "export $FHIR_SERVICE_VERSION"
echo "export $FHIR_R4_VERSION"
echo "export $EVENTSTORAGE_VERSION"
echo "export $WEBARZT_GUI_VERSION"
echo "export $WEBARZT_GUI2_VERSION"


