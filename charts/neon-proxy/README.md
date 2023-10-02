# neon-proxy

![Version: 1.7.2](https://img.shields.io/badge/Version-1.7.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) [![Lint and Test Charts](https://github.com/neondatabase/helm-charts/actions/workflows/lint-test.yaml/badge.svg)](https://github.com/neondatabase/helm-charts/actions/workflows/lint-test.yaml)

Neon Proxy

**Homepage:** https://neon.tech

## Source Code

* <https://github.com/neondatabase/neon>

## Installing the Chart

To install the chart with the release name `neon-proxy`:

```console
$ helm repo add neondatabase https://neondatabase.github.io/helm-charts
$ helm install neon-proxy neondatabase/neon-proxy
```

## Requirements

Kubernetes: `^1.18.x-x`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for pod assignment |
| containerLifecycle | object | `{}` | container lifecycle hooks specification for neon-proxy container |
| deploymentStrategy | object | `{"type":"Recreate"}` | strategy override for deployment |
| exposedService.annotations | object | `{}` | Annotations to add to the exposed service |
| exposedService.httpsPort | int | `nil` | Exposed Service https port. If null, https server will not be exposed. |
| exposedService.port | int | `5432` | Exposed Service proxy port |
| exposedService.type | string | `"LoadBalancer"` | Exposed service type |
| extraManifests | list | `[]` | Additional manifests that are created with the chart |
| fullnameOverride | string | `""` | String to fully override neon-proxy.fullname template |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"neondatabase/neon"` | Neondatabase image repository |
| image.tag | string | `"latest"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Specify docker-registry secret names as an array |
| metrics.enabled | bool | `false` | Enable prometheus metrcis autodiscovery |
| metrics.serviceMonitor.enabled | bool | `false` | Create ServiceMonitor resource |
| metrics.serviceMonitor.interval | string | `"10s"` | Interval in which prometheus scrapes |
| metrics.serviceMonitor.namespace | string | `""` | The namespace in which the ServiceMonitor will be created, if empty then Release.Namespace used |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` | Scrape Timeout duration for prometheus |
| metrics.serviceMonitor.selector | object | `{}` | Additional labels to attach (used by Prometheus operator) |
| nameOverride | string | `""` | String to partially override neon-proxy.fullname template (will maintain the release name) |
| nodeSelector | object | `{}` | Node labels for pod assignment. |
| podAnnotations | object | `{}` | Annotations for neon-proxy pods |
| podLabels | object | `{}` | Additional labels for neon-proxy pods |
| podSecurityContext | object | `{}` | neon-proxy's pods Security Context |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` | neon-proxy's containers Security Context |
| service.annotations | object | `{}` | Annotations to add to the service |
| service.httpPort | int | `9090` | Http management port |
| service.port | int | `7000` | Service management port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| settings.authBackend | string | `"link"` | auth method used (console|link|postgres) |
| settings.authEndpoint | string | `""` | auth endpoint, e.g. "http://console.neon/authenticate_proxy_request/" |
| settings.controlplane_token | string | `""` | (string) JWT token to pass to control plane management API |
| settings.domain | string | `""` | domain used in TLS cert for client postgres connections |
| settings.extraDomains | list | `[]` | domains used in extra TLS certs for client postgres connections |
| settings.metricCollectionEndpoint | string | `""` | (url) endpoint used to send metrics to. If null, metrics will not be sent. |
| settings.metricCollectionInterval | string | `""` | (string) how often metrics should be sent. |
| settings.otelExporterOtlpEndpoint | string | `""` | OpenTelemetry collector URL (will be converted into `OTEL_EXPORTER_OTLP_ENDPOINT` environment variable) |
| settings.sentryEnvironment | string | `"development"` | "development" or "production". It will be visible in sentry in order to filter issues |
| settings.sentryUrl | string | `""` | url (will be converted into `SENTRY_DSN` environment variable) used by sentry to collect error/panic events in neon-proxy |
| settings.uri | string | `""` |  |
| settings.useCertManager | bool | `true` |  |
| settings.wssPort | int | `nil` | numeric port used for wss/https connections. If null, wss server will not be started |
| settings.requireClientIP | bool | `false` | terminate any connections that don't begin with a ProxyProtocol V2 header, or those that don't contain an IP address. |
| terminationGracePeriodSeconds | int | `30` | Deployment's terminationGracePeriodSeconds |
| tolerations | list | `[]` | Tolerations for pod assignment. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.9.1](https://github.com/norwoodj/helm-docs/releases/v1.9.1)
