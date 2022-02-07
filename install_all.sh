#!/bin/bash 

dir=$(dirname "$0")
function create_network()
{
    docker network create local
}

function build_services()
{
    cd ./telerix 
    docker-compose up -d 
    cd ../website 
    docker-compose up -d
    cd ../icecast_liquidsoap
    docker-compose up -d
}

function build()
{
    create_network
    build_services
}

build