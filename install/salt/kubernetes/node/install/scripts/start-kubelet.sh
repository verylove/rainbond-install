#!/bin/sh

KUBELET_OPTS="--address=$HOST_IP \
--port=10250 \
--hostname_override=$HOST_UUID \
--kubeconfig={{ pillar['rbd-path'] }}/kubernetes/kubecfg/admin.kubeconfig \
--require-kubeconfig \
--cert-dir={{ pillar['rbd-path'] }}/kubernetes/ssl \
--cluster-domain=cluster.local. --hairpin-mode promiscuous-bridge \
--cluster-dns=$DNS_SERVERS \
--register-node=${REG:-true} \
--max-pods=10000 \
--custom-config={{ pillar['rbd-path'] }}/kubernetes/k8s/custom.conf \
--network-plugin=cni \
--network-plugin-dir={{ pillar['rbd-path'] }}/cni/bin \
--cni-conf-dir={{ pillar['rbd-path'] }}/cni/net.d \
--cpu-cfs-quota=false \
--pod-infra-container-image=goodrain.me/pause-amd64:3.0 \
--logtostderr=true \
--log-driver=streamlog \
--maximum-dead-containers-per-container=0 \
--v=2"

exec /usr/local/bin/kubelet $KUBELET_OPTS
