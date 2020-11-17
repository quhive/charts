# Kubernetes Cloud Controller Manager for Hetzner Cloud
[![GitHub Actions status](https://github.com/hetznercloud/hcloud-cloud-controller-manager/workflows/Run%20tests/badge.svg)](https://github.com/hetznercloud/hcloud-cloud-controller-manager/actions)

The Hetzner Cloud cloud controller manager integrates your Kubernets cluster with the Hetzner Cloud API.
Read more about kubernetes cloud controller managers in the [kubernetes documentation](https://kubernetes.io/docs/tasks/administer-cluster/running-cloud-controller/).

## Features

- **instances interface**: adds the server type to the `beta.kubernetes.io/instance-type` label, sets the external ipv4 and ipv6 addresses and deletes nodes from Kubernetes that were deleted from the Hetzner Cloud.
- **zones interface**: makes Kubernetes aware of the failure domain of the server by setting the `failure-domain.beta.kubernetes.io/region` and `failure-domain.beta.kubernetes.io/zone` labels on the node.
- **Private Networks**: allows to use Hetzner Cloud Private Networks for your pods traffic.
- **Load Balancers**: allows to use Hetzner Cloud Load Balancers with Kubernetes Services
