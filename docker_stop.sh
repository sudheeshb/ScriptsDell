#!/bin/bash

noArgs=$#;                                                                                                                     
                                                                                                                               
if [ $noArgs != 1 ]                                                                                                           
then                                                                                                              
    echo "Usage docker_toggle  0/1  (0-stop, 1-start) "                                                                          
    exit;
fi;


if [ $1 == "0" ]
then
   toggle="stop";
   echo $toggle;
fi;


if [ $1 == "1" ]
then
   toggle="start";
   echo $toggle;
fi;

docker $toggle  transmission
docker $toggle  radarr
docker $toggle  sonarr
docker $toggle  nzbget
docker $toggle  prowlarr
docker $toggle  dashy
docker $toggle  snippet 
