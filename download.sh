#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

k8sVersion=v1.17.4
calicoVersion=v3.13.1

images=(k8s.gcr.io/pause:3.1 k8s.gcr.io/kube-apiserver:${k8sVersion} k8s.gcr.io/kube-controller-manager:${k8sVersion} \ 
   k8s.gcr.io/kube-scheduler:${k8sVersion}  k8s.gcr.io/kube-proxy:${k8sVersion} \ 
   k8s.gcr.io/etcd:3.4.3-0 k8s.gcr.io/coredns:1.6.5   \ 
   calico/node:${calicoVersion} calico/pod2daemon-flexvol:${calicoVersion}  calico/dikastes:${calicoVersion} \ 
   calico/cni:${calicoVersion} calico/flannel-migration-controller:${calicoVersion} \ 
   calico/kube-controllers:${calicoVersion}  calico/typha:${calicoVersion} \ 
   nginx:${1.16.0} quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.30.0)

for image in ${images[@]}; 
do
   echo ${image}
   docker pull ${image}
done

echo "save images ${images[@]}"
docker save -o ok8s.tar.gz  ${images[@]}
