{{- define "shopverse.backend.image" -}}
{{ printf "%s/%s:%s" .Values.image.uri .Values.image.name .Values.image.version }}
{{- end }}

{{- define "common.checksum" -}}

{{- if .Values.configmaps }}
  {{- range .Values.configmaps.local }}
checksum/configmap-local-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}

  {{- range .Values.configmaps.global }}
checksum/configmap-global-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}
{{- end }}

{{- if .Values.secrets }}
  {{- range .Values.secrets.local }}
checksum/secret-local-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}

  {{- range .Values.secrets.global }}
checksum/secret-global-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}
{{- end }}

{{- end }}
