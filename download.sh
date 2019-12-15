#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p tdown
cd tdown
curl -LO https://github.com/OpenShot/openshot-qt/releases/download/v2.4.4/OpenShot-v2.4.4-x86_64.AppImage
cd ${DIR}
tar -czvf ${DIR}/tdown.tar.gz -C ${DIR}/tdown .