# HCloud CSI

The Hetzner Cloud CSI provides your Kubernetes Cluster with a Kubernetes Container Storage Interface driver for Hetzner Cloud Volumes. Read more about kubernetes storage in the [kubernetes documentation](https://kubernetes.io/docs/concepts/storage/).

## TL;DR;

```console
$ helm repo add quhive https://quhive.github.io/charts/
$ helm install hcloud-csi quhive/hcloud-csi --set token=<hcloud-token>
```

## Introduction

This chart installs the [hetznercloud/csi-driver](https://github.com/hetznercloud/csi-driver) into your Kubernetes cluster.

## Prerequisites

- Kubernetes 1.22+
- Helm 3.0+

## Installing the Chart

To install the chart with the release name `hcloud-csi`:

```console
$ helm repo add quhive https://quhive.github.io/charts/
$ helm install hcloud-csi quhive/hcloud-csi --set token=<hcloud-token>
```

The command deploys the hcloud-csi chart on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall the `hcloud-csi` deployment:

```console
$ helm delete hcloud-csi
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the hcloud-csi chart and their default values.

| Name | Description | Value |
|------|-------------|-------|
| `image.repository` | Image repository | `docker.io` |
| `image.repository` | Image repository | `hetznercloud/hcloud-csi-driver` |
| `image.tag` | Image tag | `v1.6.0` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.pullSecrets` | Image pull secrets | `[]` |
| `priorityClassNames` | Priority class assigned to the pod | `system-node-critical` |
| `affinity` | Affinity for the hcloud-ccm pod | `{}` |
| `hcloud.token` | HCloud API token | `""` |
| `hcloud.node.kubeletPath` | Path of the hosts kubelet folder | `"/var/lib/kubelet"` |
| `hcloud.controller.replicas` | Replica count for the HCloud CSI controller | `1` |
| `hcloud.storageClass.enabled` | Enable the HCloud CSI storageclass | `true` |
| `hcloud.storageClass.name` | Name of the HCloud CSI storageclass | `hcloud-csi` |
| `hcloud.storageClass.default` | Wheather to make the HCloud CSI storageclass the default storageclass | `false` |
| `hcloud.storageClass.reclaimPolicy` | HCloud CSI storageclass reclaim policy. Allowed values: Delete, Retain | `"Delete"` |
| `hcloud.debug` | Enable debugging | `false` |
