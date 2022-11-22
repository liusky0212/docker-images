imagestore="/tmp/images/"
dockerRegistry="harbor.dev.21vianet.com/cube-studio/"

mkdir -p $imagestore

for i in `cat /root/list`;
do image=$i;
echo "开始拉取镜像：$image"
docker pull $image

echo "更换标签"
imageString=${image##*\/};
echo $dockerRegistry$imageString
docker tag $i $dockerRegistry$imageString
echo "打包镜像"
docker save -o  $imagestore$imageString.tar $dockerRegistry$imageString
done
