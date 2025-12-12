{{/*
Expand the name of the chart.
*/}}
{{- define "neon-proxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "neon-proxy.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified deployment name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "neon-proxy.deploymentName" -}}
{{- if ._zoneSuffix }}
{{- $truncname := (include "neon-proxy.fullname" .) | trunc (len ._zoneSuffix | sub 63 | int) | trimSuffix "-" }}
{{- printf "%s%s" $truncname ._zoneSuffix }}
{{- else }}
{{- include "neon-proxy.fullname" . }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "neon-proxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "neon-proxy.labels" -}}
helm.sh/chart: {{ include "neon-proxy.chart" . }}
{{ include "neon-proxy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "neon-proxy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "neon-proxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- with ._zone }}
topology.kubernetes.io/zone: {{ . }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "neon-proxy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "neon-proxy.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name for TLS certificate and it's secret
*/}}
{{- define "neon-proxy.certificate-name" -}}
{{- . | replace "." "-" | replace "*" "wildcard" -}}
{{- end -}}
{{- define "neon-proxy.certificate-secret" -}}
{{ include "neon-proxy.certificate-name" . }}-tls
{{- end }}
