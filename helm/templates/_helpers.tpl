{{- define "shopverse.backend.image" -}}
{{ printf "%s/%s:%s" .Values.image.uri .Values.image.name .Values.image.version }}
{{- end }}

{{/* common checksum - ONLY local resources */}}
{{- define "common.checksum" -}}

{{- with .Values.configmaps }}
  {{- range .local | default list }}
checksum/configmap-local-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}
{{- end }}

{{- with .Values.secrets }}
  {{- range .local | default list }}
checksum/secret-local-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}
{{- end }}

{{- end }}
