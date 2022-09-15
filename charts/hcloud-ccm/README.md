# HCloud CCM

The Hetzner Cloud cloud controller manager integrates your Kubernets cluster with the Hetzner Cloud API. Read more about kubernetes cloud controller managers in the [kubernetes documentation](https://kubernetes.io/docs/tasks/administer-cluster/running-cloud-controller/).

## TL;DR;

```console
$ helm repo add quhive https://quhive.github.io/charts/
$ helm install hcloud-ccm quhive/hcloud-ccm --set token=<hcloud-token>
```

## Introduction

This chart installs the [hetznercloud/hcloud-cloud-controller-manager](https://github.com/hetznercloud/hcloud-cloud-controller-manager) into your Kubernetes cluster.

## Prerequisites

- Kubernetes 1.22+
- Helm 3.0+

## Installing the Chart

To install the chart with the release name `hcloud-ccm`:

```console
$ helm repo add quhive https://quhive.github.io/charts/
$ helm install hcloud-ccm quhive/hcloud-ccm --set token=<hcloud-token>
```

The command deploys the hcloud-ccm chart on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall the `hcloud-ccm` deployment:

```console
$ helm delete hcloud-ccm
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the hcloud-ccm chart and their default values.

| Name | Description | Value |
|------|-------------|-------|
| `image.repository` | Image repository | `docker.io` |
| `image.repository` | Image repository | `hetznercloud/hcloud-cloud-controller-manager` |
| `image.tag` | Image tag | `v1.13.0` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.pullSecrets` | Image pull secrets | `[]` |
| `hcloud.token` | HCloud API token | `""` |
| `hcloud.addressFamily` | Set address familiy to be managed. Allowed values: ipv4, ipv6, dualstack | `ipv4` |
| `hcloud.network.enabled` | Enable HCloud network support | `false` |
| `hcloud.network.id` | Name or ID of the HCloud network | `network-1` |
| `hcloud.network.subnet` | Subnet of the HCloud network | `10.244.0.0/16` |
| `hcloud.network.disableAttachedCheck` | Disable check if node is attached to network | `false` |
| `hcloud.loadBalancers.enabled` | Enable HCloud Loadbalancer support | `false` |
| `hcloud.loadBalancers.defaults.location` | Default load balancer instance network zone (ignored when default location is set) | `` |
| `hcloud.loadBalancers.defaults.networkZone` | Default load balancer instance network zone (ignored when default location is set) | `` |
| `hcloud.loadBalancers.defaults.usePrivateIp` | Use private IP to upstream servers | `` |
| `hcloud.loadBalancers.defaults.disablePrivateIngress` | Disable private ingress | `` |
| `hcloud.loadBalancers.defaults.disableIPv6` | Disable IPv6 support | `` |
| `hcloud.debug` | Enable debugging | `false` |
