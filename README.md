# Helm Charts

This repository contains my personal collection of Helm charts.

## Available Charts

The following charts are available in this repository:

| Chart | App Version | Chart Version | Description |
|---|---|---|---|
| [glance](#glance) | `v0.8.4` | `0.1.9` | A self-hosted dashboard to browse your Kubernetes cluster. |

---

## Usage

### Add the Helm Repository

To add this Helm repository to your local Helm client, run the following command:

```bash
helm repo add rphllc https://rphllc.github.io/helm
```

### Install a Chart

To install a chart from this repository, use the `helm install` command. For example, to install the `glance` chart:

```bash
helm install my-glance rphllc/glance
```

Replace `my-glance` with the release name of your choice.

---

## Charts

### glance

[Glance](https://glance.app/) is a self-hosted dashboard to browse your Kubernetes cluster.

**Installation:**

```bash
helm repo add rphllc https://rphllc.github.io/helm
helm install my-glance rphllc/glance
```

**Configuration:**

You can customize the installation by creating a `values.yaml` file and passing it to the `helm install` command. For example:

```yaml
# my-values.yaml
replicaCount: 1
service:
  type: ClusterIP
  port: 80
ingress:
  enabled: true
  className: ""
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: ImplementationSpecific
```

```bash
helm install my-glance rphllc/glance -f my-values.yaml
```

---

## Automation

This repository uses GitHub Actions to automate the following tasks:

*   **Lint and Test:** On every pull request and push to the `main` branch, the charts are linted and tested using [chart-testing](https://github.com/helm/chart-testing).
*   **Publish Charts:** When changes are pushed to the `main` branch in the `charts/` directory, the corresponding chart is packaged and published to the GitHub Pages of this repository.
*   **Sync Upstream Releases:** A scheduled workflow runs daily to check for new releases of the upstream applications. If a new release is found, a pull request is automatically created to update the `appVersion` and bump the chart version.

## Contributing

Contributions are welcome! Please open an issue or a pull request if you have any suggestions or improvements.

## License

This project is licensed under the MIT License.