#!/bin/bash 

function stop_services()
{
	docker stop telerix
	docker stop website
	docker stop website_db
	docker stop icecast
}

function delete_services()
{
	docker container rm telerix
	docker container rm website
	docker container rm website_db
	docker container rm icecast
}

function delete_volumes()
{
	docker volume prune -f
}

function delete_networks()
{
	docker network prune -f
}

function delete_images()
{
	docker image rm fill205/telerix:latest
	docker image rm mysql:5.7
	docker image rm wordpress:latest
	docker image rm fill205/icecast_liquidsoap:latest
}

function delete_all()
{
	stop_services
	delete_services
	delete_volumes
	delete_networks
	delete_images
}


function final()
{
echo ""
echo ""
echo "Das löschen führt dazu, dass all deine Daten unwideruflich gelöscht werden."
echo "Bist du dir sicher das du alle Container, Images, Volumes und Netzwerke löschen möchtest?"
echo ""
echo "Bestätige mit y: "
read confirmation
echo ""

if 
	[ "$confirmation" == "y" ]
then 
	echo ""
	echo "Ok, es werden alle Container, Volumes, Images und Networks gelöscht. Es wird einen Moment dauern, bitte keine weitere Eingaben tätigen..."
	echo ""
	delete_all
else
	echo ""
	echo "Ok, der Löschvorgang wurde abgebrochen!"
	echo ""
	exit 0
fi
}

final;
