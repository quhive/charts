# QuHive / Charts

[![](https://github.com/quhive/charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/quhive/charts/actions)

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add quhive https://quhive.github.io/charts/
```

You can then run `helm search repo quhive` to see the charts.

## Charts

* [hcloud-ccm](https://github.com/quhive/charts/tree/master/charts/hcloud-ccm)
* [hcloud-csi](https://github.com/quhive/charts/tree/master/charts/hcloud-csi)

```bash
helm install --name your-release quhive/external-dns
```

Also see [helm hub](https://hub.helm.sh/charts/quhive) for a complete list.
