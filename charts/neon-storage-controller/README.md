# neon-storage-controller

![Version: 1.10.0](https://img.shields.io/badge/Version-1.10.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) [![Lint and Test Charts](https://github.com/neondatabase/helm-charts/actions/workflows/lint-test.yaml/badge.svg)](https://github.com/neondatabase/helm-charts/actions/workflows/lint-test.yaml)

Neon storage controller

**Homepage:** https://neon.tech

## Source Code

* <https://github.com/neondatabase/neon>

## Installing the Chart

To install the chart with the release name `neon-storage-controller`:

```console
$ helm repo add neondatabase https://neondatabase.github.io/helm-charts
$ helm install neon-storage-controller neondatabase/neon-storage-controller
```

## Requirements

Kubernetes: `^1.18.x-x`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for pod assignment |
| extraManifests | list | `[]` | Additional manifests that are created with the chart |
| fullnameOverride | string | `""` | String to fully override neon-storage-controller.fullname template |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"neondatabase/neon"` | Neondatabase image repository |
| image.tag | string | `"latest"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Specify docker-registry secret names as an array |
| ingress.annotations | object | `{}` | Additional annotations for Ingress resource. |
| ingress.className | string | `"nginx-int"` | Ingress class for controller |
| ingress.enabled | bool | `true` | Enable ingress controller resource. |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.hosts[0].paths[0].protocol | string | `"TCP"` |  |
| metrics.enabled | bool | `false` | Enable prometheus metrcis autodiscovery |
| metrics.serviceMonitor.enabled | bool | `false` | Create ServiceMonitor resource |
| metrics.serviceMonitor.interval | string | `"10s"` | Interval in which prometheus scrapes |
| metrics.serviceMonitor.namespace | string | `""` | The namespace in which the ServiceMonitor will be created, if empty then Release.Namespace used |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` | Scrape Timeout duration for prometheus |
| metrics.serviceMonitor.selector | object | `{}` | Additional labels to attach (used by Prometheus operator) |
| nameOverride | string | `""` | String to partially override neon-storage-controller.fullname template (will maintain the release name) |
| nodeSelector | object | `{}` | Node labels for pod assignment. |
| podAnnotations | object | `{}` | Annotations for neon-storage-controller pods |
| podLabels | object | `{}` | Additional labels for neon-storage-controller pods |
| podSecurityContext | object | `{}` | neon-storage-controller's pods Security Context |
| priorityClassName | string | `""` | Pod priority class |
| registerControlPlane.controlPlaneJwtToken | string | `""` |  |
| registerControlPlane.enable | bool | `false` |  |
| registerControlPlane.resources.limits.cpu | string | `"100m"` |  |
| registerControlPlane.resources.limits.memory | string | `"128M"` |  |
| registerControlPlane.resources.requests.cpu | string | `"100m"` |  |
| registerControlPlane.resources.requests.memory | string | `"128M"` |  |
| resources.limits.memory | string | `"4Gi"` |  |
| resources.requests.cpu | string | `"1"` |  |
| resources.requests.memory | string | `"1Gi"` |  |
| securityContext | object | `{}` | neon-storage-controller's containers Security Context |
| service.annotations | object | `{}` | Annotations to add to the service |
| service.port | int | `50051` | controller listen port |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| settings.chaosExitCrontab | string | `""` | Chaos testing for immediate exit crontab |
| settings.chaosInterval | string | `""` | Chaos testing for tenant migration interval |
| settings.controlPlaneJwtToken | string | `""` |  |
| settings.controlPlaneUrl | string | `""` | Base URL for control plane API endpoints (e.g., https://control-plane.example.com/storage/api/v1/) |
| settings.databaseUrl | string | `""` |  |
| settings.initialSplitShards | string | `""` | Number of shards to use for initial tenant splits. |
| settings.initialSplitThreshold | string | `""` | Size threshold in bytes for initial tenant splits. |
| settings.jwtToken | string | `""` |  |
| settings.longReconcileThreshold | string | `"30min"` | If a reconciliation takes longer than this, bump an alerting metric |
| settings.maxSplitShards | string | `""` | Maximum number of shards for autosplits. |
| settings.peerJwtToken | string | `""` | JWT token for authentication with other storage controller instances |
| settings.publicKey | string | `""` |  |
| settings.safekeeperJwtToken | string | `""` | JWT token for authentication with safekeepers |
| settings.sentryEnvironment | string | `"development"` | "development" or "production". It will be visible in sentry in order to filter issues |
| settings.sentryUrl | string | `""` | url (will be converted into `SENTRY_DSN` environment variable) used by sentry to collect error/panic events in storage-controller |
| settings.splitThreshold | string | `""` | Shard size threshold in bytes for automatically splitting shards.  Omit to disable auto-sharding (default) |
| settings.startAsCandidate | bool | `false` | When set to True, restart the service gracefully |
| tolerations | list | `[]` | Tolerations for pod assignment. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.9.1](https://github.com/norwoodj/helm-docs/releases/v1.9.1)
