#!/bin/bash -x

# Kubctl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && rm kubectl 

# Fluxcd
curl -s https://fluxcd.io/install.sh | bash 

# Helm
HELM_VERSION=v3.8.1
curl -LO  https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz 
tar xvf helm-${HELM_VERSION}-linux-amd64.tar.gz 
install -o root -g root -m 0755 linux-amd64/helm /usr/local/bin/helm 
rm -r helm-${HELM_VERSION}-linux-amd64.tar.gz && rm -rf linux-amd64 

DOCTL_VERSION=1.74.0
wget https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-1.74.0-linux-amd64.tar.gz 
tar xvf doctl-${DOCTL_VERSION}-linux-amd64.tar.gz 
mv doctl /usr/local/bin 
rm doctl-${DOCTL_VERSION}-linux-amd64.tar.gz 
chmod +x /usr/local/bin/doctl 

# Kustomize
KUSTOMIZE_VERSION=v4.5.4
wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz 
tar xvf kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz 
mv kustomize /usr/local/bin 
rm kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz 
chmod +x /usr/local/bin/kustomize 

# Evnsub
ENVSUB_VERSION=v1.2.0
curl -SL https://github.com/a8m/envsubst/releases/download/${ENVSUB_VERSION}/envsubst-Linux-x86_64 -o /usr/local/bin/envsubst && chmod +x /usr/local/bin/envsubst 

# Ekctl
EKCTL_VERSION=v0.96.0
curl -SL https://github.com/weaveworks/eksctl/releases/download/${EKCTL_VERSION}/eksctl_Linux_amd64.tar.gz -o eksctl.tar.gz && tar xvf eksctl.tar.gz && mv eksctl /usr/local/bin && chmod +x /usr/local/bin/eksctl && rm eksctl.tar.gz 

# Sops
SOPS_VERSION=v3.7.2
curl -SL https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.amd64 -o /usr/local/bin/sops && chmod +x /usr/local/bin/sops 

# GH
GH_VERSION=2.13.0
wget https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_386.tar.gz && tar xvf gh_${GH_VERSION}_linux_386.tar.gz && mv gh_${GH_VERSION}_linux_386/bin/gh /usr/local/bin && rm -rf gh_${GH_VERSION}_linux_386/ && rm -rf gh_${GH_VERSION}_linux_386.tar.gz

# JQ
JQ_VERSION=1.6
curl -SL https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -o /usr/local/bin/jq  && chmod +x /usr/local/bin/jq

# YQ
YQ_VERSION=4.27.2
curl -SL https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq

# Setup completion for kubectl
echo 'source <(kubectl completion bash)' >>~/.bashrc
# Setup alias for 'k' for kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
# Setup completion for flux
echo 'source <(flux completion bash)' >>~/.bashrc
# Setup completion for doctl
echo 'source <(doctl completion bash)' >>~/.bashrc

