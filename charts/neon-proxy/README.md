# neon-proxy

![Version: 1.7.25](https://img.shields.io/badge/Version-1.7.25-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) [![Lint and Test Charts](https://github.com/neondatabase/helm-charts/actions/workflows/lint-test.yaml/badge.svg)](https://github.com/neondatabase/helm-charts/actions/workflows/lint-test.yaml)

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
| resources.limits.memory | string | `"32Gi"` |  |
| resources.requests.cpu | string | `"400m"` |  |
| resources.requests.memory | string | `"2Gi"` |  |
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
| settings.authRateLimits | string | `nil` |  |
| settings.authRateLimitsEnabled | bool | `nil` | Whether to enable the authentication rate limiter |
| settings.awsAccessKeyId | string | `""` | AWS Access Key ID |
| settings.awsRegion | string | `""` | Aws region to retrieve credentials |
| settings.awsSecretAccessKey | string | `""` | AWS Secret Access Key |
| settings.connectComputeLock | string | `""` | Configures the locking of connect_compute per compute |
| settings.controlplane_token | string | `""` | JWT token to pass to control plane management API |
| settings.disableDynamicRateLimiter | bool | `true` | Disable dynamic rate limiter |
| settings.domain | string | `""` | domain used in TLS cert for client postgres connections |
| settings.endpointCacheConfig | string | `""` | Config for cache for all valid endpoints |
| settings.endpointRpsLimits | list | `[]` | list of rate limiters for connection attempts over different time intervals |
| settings.extraDomains | list | `[]` | domains used in extra TLS certs for client postgres connections |
| settings.httpPoolOptIn | bool | `true` | Sets the SQL over HTTP Pool to opt-in-only mode if true. Set false to enable it always |
| settings.metricBackupCollectionChunkSize | string | `"4194304"` | How large each chunk of the metric backup files should be in bytes |
| settings.metricBackupCollectionInterval | string | `"10m"` |  |
| settings.metricBackupCollectionRemoteStorage | string | `""` | Storage location to upload the metric backup files to |
| settings.metricCollectionEndpoint | url | `""` | endpoint used to send metrics to. If null, metrics will not be sent. |
| settings.metricCollectionInterval | string | `""` | how often metrics should be sent. |
| settings.otelExporterDisabled | bool | `false` | Disables OpenTelemetry (will be converted into `OTEL_SDK_DISABLED` environment variable) |
| settings.otelExporterOtlpEndpoint | string | `""` | OpenTelemetry collector URL (will be converted into `OTEL_EXPORTER_OTLP_ENDPOINT` environment variable) |
| settings.parquetUploadCompression | string | `"uncompressed"` | What level of compression to use |
| settings.parquetUploadDisconnectEventsRemoteStorage | string | `""` | Storage location to upload the parquet files with disconnect events to. |
| settings.parquetUploadMaximumDuration | string | `"20m"` | How long to wait before forcing a file upload |
| settings.parquetUploadPageSize | string | `"1048576"` | How large each column page should be in bytes |
| settings.parquetUploadRemoteStorage | string | `""` | Storage location to upload the parquet files to. |
| settings.parquetUploadRowGroupSize | string | `"8192"` | How many rows to include in a row group |
| settings.parquetUploadSize | string | `"100000000"` | How large the total parquet file should be in bytes |
| settings.redisClusterName | string | `"regional-control-plane-redis"` | Redis cluster name, used in aws elasticache |
| settings.redisHost | string | `""` | Redis host for streaming connections (might be different from the notifications host) |
| settings.redisNotifications | url | `""` | Configures redis client |
| settings.redisPort | string | `""` | Redis port for streaming connections |
| settings.redisUserId | string | `"neon"` | Redis user_id, used in aws elasticache |
| settings.region | string | `""` | Region this proxy service is deployed into |
| settings.rustLog | string | `"INFO"` | Proxy log level |
| settings.sentryEnvironment | string | `"development"` | "development" or "production". It will be visible in sentry in order to filter issues |
| settings.sentryUrl | string | `""` | url (will be converted into `SENTRY_DSN` environment variable) used by sentry to collect error/panic events in neon-proxy |
| settings.sqlOverHttpTimeout | string | `"15s"` | timeout for http connection requests |
| settings.uri | string | `""` |  |
| settings.useCertManager | bool | `true` |  |
| settings.wakeComputeLimits | list | `[]` | list of rate limiters for wake_compute over different time intervals |
| settings.wakeComputeLock | string | `"permits=0"` | Configures the locking of wake_compute per endpoint |
| settings.wssPort | int | `nil` | numeric port used for wss/https connections. If null, wss server will not be started |
| terminationGracePeriodSeconds | int | `30` | Deployment's terminationGracePeriodSeconds |
| tolerations | list | `[]` | Tolerations for pod assignment. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
