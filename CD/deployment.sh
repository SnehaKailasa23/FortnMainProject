#!/bin/bash
############replacing docker-stack.yml varibles
for i in `grep -e $1 -e global environment_details`; do
 a=`cut -d '_' -f2 <<<$i`
 b=`cut -d '=' -f1 <<<$a`
 c=`cut -d '=' -f2 <<<$a`
 sed -i "s|$b|$c|g" docker-stack.yml
done
###########starting docker stack#######
App_status=`docker stack ps $2`
echo $App_status
if [ ! -z "$App_status" ];
then
  docker stack rm $2
fi

