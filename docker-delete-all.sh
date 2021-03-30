#!/bin/bash

# This code helps to delete all containers, 
# networks and volumes associated with docker

# delete containers
containers=$(docker ps -aq)

if [ ! -z "$containers" ]
then
    #count containers before
    contBefore=$(echo -n "$containers" | grep -c '^')

    # stop all containers
    docker container kill $containers

    #delete all containers
    docker container rm $containers

    #count containers after
    containers=$(docker ps -aq)
    contAfter=$(echo -n "$containers" | grep -c '^')

    echo "$(($contBefore-$contAfter)) containers(s) deleted"
else
    echo "No containers to delete"
fi

# delete networks
networks=$(docker network ls -q)

if [ ! -z "$networks" ]
then
    #count networks before
    netBefore=$(echo -n "$networks" | grep -c '^')

    docker network rm $networks 2>/dev/null

    #count networks after
    networks=$(docker network ls -q)
    netAfter=$(echo -n "$networks" | grep -c '^')

    echo "$(($netBefore-$netAfter)) network(s) deleted"
else
    echo "No networks to delete"
fi

# delete volumes
volumes=$(docker volume ls -q)

if [ ! -z "$volumes" ]
then
    #count volumes before
    volBefore=$(echo -n "$volumes" | grep -c '^')

    docker volume rm $volumes 2>/dev/null

    #count volumes after
    volumes=$(docker volume ls -q)
    volAfter=$(echo -n "$volume" | grep -c '^')

    echo "$(($volBefore-$volAfter)) volume(s) deleted"
else
    echo "No volumes to delete"
fi

