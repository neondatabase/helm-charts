{{/*
Expand the name of the chart.
*/}}
{{- define "neon-pg-sni-router.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "neon-pg-sni-router.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "neon-pg-sni-router.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "neon-pg-sni-router.labels" -}}
helm.sh/chart: {{ include "neon-pg-sni-router.chart" . }}
{{ include "neon-pg-sni-router.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "neon-pg-sni-router.selectorLabels" -}}
app.kubernetes.io/name: {{ include "neon-pg-sni-router.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "neon-pg-sni-router.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "neon-pg-sni-router.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name for TLS certificate and it's secret
*/}}
{{- define "neon-pg-sni-router.certificate" -}}
{{- .Values.settings.domain | replace "." "-" | replace "*" "wildcard" }}
{{- end }}
{{- define "neon-pg-sni-router.certificate-secret" -}}
{{ include "neon-pg-sni-router.certificate" . }}-tls
{{- end }}
