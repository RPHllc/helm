{{/*
Create a default fullname
*/}}
{{- define "glance.fullname" -}}
{{- printf "%s" .Release.Name -}}
{{- end }}
