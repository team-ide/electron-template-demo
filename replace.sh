#!/bin/sh

# 移至脚本目录
cd `dirname $0`

echo `pwd`

cp -rf package.json electron-template/release/app/package.json
cp -rf config.ts electron-template/src/main/config.ts

productName='ElectronTemplateDemo'
publisherName='yourName'
publishProvider='github'
publishOwner='githubOwner'
publishRepo='githubRepo'

publish='{
  "provider": "'$publishProvider'",
  "owner": "'$publishOwner'",
  "repo": "'$publishRepo'"
}'
# 设置包相关信息
sed -i 's/\<productName\>/'$productName'/g' ./package.json
sed -i 's/\<publisherName\>/'$publisherName'/g' ./package.json
sed -i 's/"\<publish\>"/'$publish'/g' ./package.json