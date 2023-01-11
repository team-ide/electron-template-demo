#!/bin/sh

# 移至脚本目录
cd `dirname $0`

echo `pwd`

echo 'cp package.json'
cp -rf package.json electron-template/release/app/package.json
echo 'cp config.ts'
cp -rf config.ts electron-template/src/main/config.ts

productName='ElectronTemplateDemo'
publisherName='yourName'
publishProvider='github'
publishOwner='githubOwner'
publishRepo='githubRepo'

echo 'set productName='$productName
echo 'set publisherName='$publisherName
echo 'set publishProvider='$publishProvider
echo 'set publishOwner='$publishOwner
echo 'set publishRepo='$publishRepo

# 设置包相关信息
echo 'replace productName'
sed -i 's/\<productName\>/'$productName'/g' ./electron-template/package.json
echo 'replace publisherName'
sed -i 's/\<publisherName\>/'$publisherName'/g' ./electron-template/package.json
echo 'replace publish'
sed -i 's/"\<publish\>"/{"provider": "'$publishProvider'","owner": "'$publishOwner'","repo": "'$publishRepo'"}/g' ./electron-template/package.json

cat ./electron-template/package.json