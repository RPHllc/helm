{{/*
Expand the name of the chart.
*/}}
{{- define "glance.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "glance.fullname" -}}
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
{{- define "glance.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "glance.labels" -}}
helm.sh/chart: {{ include "glance.chart" . }}
{{ include "glance.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "glance.selectorLabels" -}}
app.kubernetes.io/name: {{ include "glance.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "glance.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "glance.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
A default fallback if users wipe config.data
*/}}
{{- define "glance.defaultConfig" -}}
server:
  assets-path: /app/assets
pages: []
{{- end -}}

{{/* 
Return the HTTP container port for the Glance container.

Priority order:
  1) .Values.service.ports.http.containerPort   (new schema)
  2) .Values.service.port                       (legacy schema)
  3) 8080                                       (hard default)

Rationale:
- Avoids using `dig` on .Values (which is a chartutil.Values), so no type issues.
- Emits a bare number, safe to insert into YAML (e.g., containerPort: {{ include "glance.httpContainerPort" . }}).

Usage:
  In templates/deployment.yaml:
    ports:
      - name: http
        containerPort: {{ include "glance.httpContainerPort" . }}
        protocol: TCP
*/}}
{{- define "glance.httpContainerPort" -}}
{{- $svc := (default (dict) .Values.service) -}}
{{- $ports := (get $svc "ports") | default (dict) -}}
{{- $http := (get $ports "http") | default (dict) -}}
{{- $containerPort := (get $http "containerPort") | default (get $svc "port" | default 8080) -}}
{{- $containerPort -}}
{{- end -}}
