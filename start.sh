#!/usr/bin/env bash
if [ -f .env ]; then
  echo  "arquivo .env encontrado, carregando as variáveis"
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi
echo -e "Quer criar o diretorio main? [Y/N]
-> main\n  -> nginx\n    -> default.conf\n  -> docker-compose.yml\n  -> .env"
read  RESP

if [ $RESP == "y" ] || [ $RESP == "Y" ] ; then
    mkdir main main/nginx
    touch main/docker-compose.yml main/.env main/nginx/default.conf
fi

if [ $1 == "-fo" ]; then
  echo  "deploy front only!"
    mkdir app app/front app/front/nginx
    touch app/front/.env app/front/docker-compose.yml app/front/nginx/default.conf
elif [ $1 == "-bo" ]; then
  echo "deploy back only!"
    mkdir app app/back app/back/nginx
    touch app/back/.env app/back/docker-compose.yml app/back/nginx/default.conf


elif [ $1 == "-fs" ]; then
    echo "deploy fullstack!"
    mkdir app app/front app/front/nginx
    touch app/front/.env app/front/docker-compose.yml app/front/nginx/default.conf
    mkdir app/back app/back/nginx
    touch app/back/.env app/back/docker-compose.yml app/back/nginx/default.conf
fi