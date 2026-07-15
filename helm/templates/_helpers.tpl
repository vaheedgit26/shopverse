{{- define "shopverse.backend.image" -}}
{{ printf "%s/%s:%s" .Values.image.uri .Values.image.name .Values.image.version }}
{{- end }}

{{/* common checksum */ }}
{{- define "common.checksum" -}}

{{- if .Values.configmaps }}
  {{- range .Values.configmaps.local | default list }}
checksum/configmap-local-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}

  {{- range .Values.configmaps.global | default list }}
checksum/configmap-global-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}
{{- end }}

{{- if .Values.secrets }}
  {{- range .Values.secrets.local | default list }}
checksum/secret-local-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}

  {{- range .Values.secrets.global | default list }}
checksum/secret-global-{{ .name }}: {{ include (print $.Template.BasePath "/" .fileName) $ | sha256sum }}
  {{- end }}
{{- end }}

{{- end }}
