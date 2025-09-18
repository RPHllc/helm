# Glance

A Helm chart for deploying [Glance](https://github.com/glanceapp/glance), a self-hosted dashboard for your server.

## Installing the Chart

To install the chart with the release name `my-glance`:

```bash
helm repo add glanceapp https://rphllc.github.io/helm/glance
helm install my-glance glanceapp/glance
```

> **Note**: This is a generic example. You are currently installing from a local path, which is also perfectly valid.

## Configuration

The following table lists the configurable parameters of the Glance chart and their default values.

| Parameter | Description | Default |
| :--- | :--- | :--- |
| `replicaCount` | Number of pod replicas. | `1` |
| `image.repository` | Image repository. | `docker.io/glanceapp/glance` |
| `image.pullPolicy` | Image pull policy. | `IfNotPresent` |
| `image.tag` | Image tag. Overrides the chart's `appVersion`. | `""` |
| `imagePullSecrets` | Secrets for pulling images from a private repository. | `[]` |
| `nameOverride` | Override the chart name. | `""` |
| `fullnameOverride` | Override the full release name. | `""` |
| `serviceAccount.create` | Whether to create a new service account. | `true` |
| `serviceAccount.automount` | Automount service account token. | `false` |
| `serviceAccount.annotations` | Annotations for the service account. | `{}` |
| `serviceAccount.name` | Name of the service account to use. | `""` |
| `podAnnotations` | Annotations to add to the pod. | `{}` |
| `podLabels` | Labels to add to the pod. | `{}` |
| `podSecurityContext` | Security context for the pod. | `{}` |
| `securityContext` | Security context for the container. | `{}` |
| `service.type` | Type of service to create. | `ClusterIP` |
| `service.port` | Port for the service. | `8080` |
| `service.annotations` | Annotations for the service. | `{}` |
| `ingress.enabled` | Enable Ingress. | `true` |
| `ingress.className` | Ingress class name. | `traefik` |
| `ingress.annotations` | Annotations for the Ingress. | `{}` |
| `ingress.tls` | TLS configuration for the Ingress. | `[]` |
| `ingress.hosts` | Host configuration for the Ingress. | `[{"host": "my.example.com", ...}]` |
| `livenessProbe` | Liveness probe configuration. | `{}` |
| `readinessProbe` | Readiness probe configuration. | `{}` |
| `resources` | CPU/Memory resource requests and limits. | `{ "requests": { "cpu": "100m", "memory": "128Mi" }, ... }` |
| `volumes` | Additional volumes to mount. | `[]` |
| `volumeMounts` | Additional volume mounts. | `[]` |
| `nodeSelector` | Node selector for pod assignment. | `{}` |
| `tolerations` | Tolerations for pod assignment. | `[]` |
| `affinity` | Affinity for pod assignment. | `{}` |
| `config.mainFilename` | The main configuration filename. | `glance.yml` |
| `config.data` | The default configuration for Glance. See `values.yaml` for the full default. | (string) |
| `config.files` | A map of extra files to mount in the config directory. Content is mounted literally. | `{}` |
| `config.tplFiles` | A map of extra files to mount in the config directory. Content is processed by the Helm template engine. | `{}` |
| `assets` | Configuration for custom assets. | `{}` |

---
*This README was generated with assistance from Gemini.*