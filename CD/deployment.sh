#!/bin/bash
############replacing docker-stack.yml varibles

##$1 is environment varible
##$2 is version number
##$3 is app name

for i in `grep -e $1 -e global environment_details`; do
 a=`cut -d '_' -f2 <<<$i`
 b=`cut -d '=' -f1 <<<$a`
 c=`cut -d '=' -f2 <<<$a`
 if [[ $b == *IMAGENAME ]];
 then
 sed -i "s|$b|$c:$2|g" docker-stack.yml_tmp
 fi
 sed -i "s|$b|$c|g" docker-stack.yml_tmp
done
###########starting docker stack#######
App_status=`docker stack ps $3`
echo $App_status
if [ ! -z "$App_status" ];
then
  docker stack rm $3
fi
docker stack deploy -c docker-stack.yml $3
