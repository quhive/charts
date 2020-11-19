{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cert-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cert-manager.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cert-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helm required labels */}}
{{- define "cert-manager.labels" -}}
app: {{ include "cert-manager.name" . }}
app.kubernetes.io/name: {{ template "cert-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: "cert-manager"
helm.sh/chart: {{ template "cert-manager.chart" . }}
{{- if .Values.podLabels }}
{{ toYaml .Values.podLabels }}
{{- end }}
{{- end -}}

{{/*
Return the proper External DNS image name
*/}}
{{- define "cert-manager.image" -}}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- printf "%s/%s:%s" .Values.global.imageRegistry $repositoryName $tag -}}
    {{- else -}}
        {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
    {{- end -}}
{{- else -}}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "cert-manager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "cert-manager.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Webhook templates
*/}}

{{/*
Expand the name of the chart.
Manually fix the 'app' and 'name' labels to 'webhook' to maintain
compatibility with the v0.9 deployment selector.
*/}}
{{- define "webhook.name" -}}
{{- printf "webhook" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "webhook.fullname" -}}
{{- $trimmedName := printf "%s" (include "cert-manager.fullname" .) | trunc 55 | trimSuffix "-" -}}
{{- printf "%s-webhook" $trimmedName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "webhook.caRef" -}}
{{ .Release.Namespace}}/{{ template "webhook.fullname" . }}-ca
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "webhook.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helm required labels */}}
{{- define "webhook.labels" -}}
app: {{ include "webhook.name" . }}
app.kubernetes.io/name: {{ template "webhook.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: "webhook"
helm.sh/chart: {{ template "webhook.chart" . }}
{{- if .Values.podLabels }}
{{ toYaml .Values.podLabels }}
{{- end }}
{{- end -}}

{{/*
Return the proper External DNS image name
*/}}
{{- define "webhook.image" -}}
{{- $registryName := .Values.webhook.image.registry -}}
{{- $repositoryName := .Values.webhook.image.repository -}}
{{- $tag := .Values.webhook.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- printf "%s/%s:%s" .Values.global.imageRegistry $repositoryName $tag -}}
    {{- else -}}
        {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
    {{- end -}}
{{- else -}}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "webhook.serviceAccountName" -}}
{{- if .Values.webhook.serviceAccount.create -}}
    {{ default (include "webhook.fullname" .) .Values.webhook.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.webhook.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
cainjector templates
*/}}

{{/*
Expand the name of the chart.
Manually fix the 'app' and 'name' labels to 'cainjector' to maintain
compatibility with the v0.9 deployment selector.
*/}}
{{- define "cainjector.name" -}}
{{- printf "cainjector" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cainjector.fullname" -}}
{{- $trimmedName := printf "%s" (include "cert-manager.fullname" .) | trunc 52 | trimSuffix "-" -}}
{{- printf "%s-cainjector" $trimmedName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cainjector.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helm required labels */}}
{{- define "cainjector.labels" -}}
app: {{ include "cainjector.name" . }}
app.kubernetes.io/name: {{ template "cainjector.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: "cainjector"
helm.sh/chart: {{ template "cainjector.chart" . }}
{{- if .Values.podLabels }}
{{ toYaml .Values.podLabels }}
{{- end }}
{{- end -}}

{{/*
Return the proper External DNS image name
*/}}
{{- define "cainjector.image" -}}
{{- $registryName := .Values.cainjector.image.registry -}}
{{- $repositoryName := .Values.cainjector.image.repository -}}
{{- $tag := .Values.cainjector.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- printf "%s/%s:%s" .Values.global.imageRegistry $repositoryName $tag -}}
    {{- else -}}
        {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
    {{- end -}}
{{- else -}}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "cainjector.serviceAccountName" -}}
{{- if .Values.cainjector.serviceAccount.create -}}
    {{ default (include "cainjector.fullname" .) .Values.cainjector.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.cainjector.serviceAccount.name }}
{{- end -}}
{{- end -}}