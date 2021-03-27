# Container Storage Interface driver for Hetzner Cloud

[![GitHub Actions status](https://github.com/hetznercloud/csi-driver/workflows/Run%20tests/badge.svg)](https://github.com/hetznercloud/csi-driver/actions)

This is a [Container Storage Interface](https://github.com/container-storage-interface/spec) driver for Hetzner Cloud
enabling you to use Volumes within Kubernetes. Please note that this driver **requires Kubernetes 1.13 or newer**.
## TL;DR

```console
$ helm repo add quhive https://quhive.github.io/charts
$ helm install hcloud-csi quhive/hcloud-csi --set hcloudToken=HCLOUD_TOKEN
```

## Versioning policy

We aim to support the latest three versions of Kubernetes. After a new
Kubernetes version has been released we will stop supporting the oldest
previously supported version. This does not necessarily mean that the
CSI driver does not still work with this version. However, it means that
we do not test that version anymore. Additionally we will not fix bugs
related only to an unsupported version.

| Kubernetes | CSI Driver    | Deployment File                                                                                    |
| ---------- | -------------:| --------------------------------------------------------------------------------------------------:|
| 1.20       | 1.5.3, master | https://raw.githubusercontent.com/hetznercloud/csi-driver/master/deploy/kubernetes/hcloud-csi.yml  |
| 1.19       | 1.5.1         | https://raw.githubusercontent.com/hetznercloud/csi-driver/v1.5.1/deploy/kubernetes/hcloud-csi.yml  |
| 1.18       | 1.5.1         | https://raw.githubusercontent.com/hetznercloud/csi-driver/v1.5.1/deploy/kubernetes/hcloud-csi.yml  |

## Parameters

The following table lists the configurable parameters of the minecraft-server chart and their default values.

```
TODO
```

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install hcloud-csi quhive/hcloud-csi --set hcloudToken=HCLOUD_TOKEN
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install my-server -f values.yaml qumine/minecraft-server
```