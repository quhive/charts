# Container Storage Interface driver for Hetzner Cloud

[![GitHub Actions status](https://github.com/hetznercloud/csi-driver/workflows/Run%20tests/badge.svg)](https://github.com/hetznercloud/csi-driver/actions)

This is a [Container Storage Interface](https://github.com/container-storage-interface/spec) driver for Hetzner Cloud
enabling you to use Volumes within Kubernetes. Please note that this driver **requires Kubernetes 1.13 or newer**.

## Version Matrix

| Kubernetes    | CSI Driver   | Deployment File |
| ------------- | -----:| ------------------------------------------------------------------------------------------------------:|
| 1.17-1.19     | 1.5.1 | https://raw.githubusercontent.com/hetznercloud/csi-driver/v1.5.1/deploy/kubernetes/hcloud-csi.yml      |
| 1.16          | 1.4.0 | https://raw.githubusercontent.com/hetznercloud/csi-driver/v1.4.0/deploy/kubernetes/hcloud-csi.yml      |