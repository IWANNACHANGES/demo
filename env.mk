FRONTEND_APPS=dcp-storage dcp-phoenix dcp-operation dcp-knowledge-base sg-passport
FRONTEND_APP_ARTIFACT_TARGETS=$(addprefix build-,$(FRONTEND_APPS))
FRONTEND_APP_DOCKER_TARGETS=$(addprefix docker-,$(FRONTEND_APPS))
FRONTEND_APP_PUBLISH_TARGETS=$(addprefix publish-,$(FRONTEND_APPS))

DOCKER=docker
DOCKER_REGISTERY?=registry.sensetime.com/senseautoempower

KIND=kind
KIND_CLUSTER_NAME=sensegear

YARN=yarn
NPM_CLIENT=npm

HELM=helm
HELM_UPGRADE=$(HELM) upgrade --install --timeout 60s
HELM_REPO=sensegear
HELM_LOCAL_REPO=local-repo
