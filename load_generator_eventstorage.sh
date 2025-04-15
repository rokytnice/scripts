#/bin/sh

counter=0


json_payload=$(cat <<EOF

{"_type":"ueberweisungen-sent","ueberweisungen":[{"ueberweisungId":"ueberweisung-7e7bec1b-8ab8-4583-b6d4-8c31384d0a20","ueberweiserOu":"858218800","ueberweisungsCode":"7Q5J4AWVTQ7F","dringlichkeiten":["DRINGEND"],"herkunftsnachweis":{"applikation":"ARZTBUCHUNG","bsnr":"858218800","arztgruppe":null,"lanr":null,"accountTyp":null,"autorisierungsRolle":null,"vermittlungscodeZuweisung":"UNABHAENGIG"},"qualifikationen":{"values":[]}}],"_created":"20240111-174115.798+0100","_by":"buchung","_origin":"webpatient","_referenceId":"240111-1741-PDWD","_version":"1.4","_created_epoch_milli":1704991275798}

EOF
)


while true; do

  curl -u admin:reverse -H "Content-Type: application/json" -v \
    -d "$json_payload" "http://localhost:8161/api/message/Consumer.EventStorage.VirtualTopic.events?type=ueberweisungen-sent"


  counter=$((counter+1))
  echo "sent messages: $counter"
  sleep 800ms
done