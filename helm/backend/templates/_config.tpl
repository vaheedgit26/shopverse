{{- define "user.config" -}}
DB_HOST: "{{ .Values.global.db.host }}"
DB_PORT: "{{ .Values.global.db.port }}"
APP_ENV: "{{ .Values.global.app.env }}"
{{- end }}
