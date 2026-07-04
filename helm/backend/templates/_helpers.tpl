{{- define "shopverse.backend.image" -}}
{{ printf "%s/%s:%s" .Values.image.uri .Values.image.name .Values.image.version }}
{{- end }}

