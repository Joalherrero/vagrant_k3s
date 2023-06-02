#!/bin/bash

#############################
# 0 - Enable repos
#############################

sudo sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*

sudo sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*

sudo yum update -y

#############################
# 0 - Install k3s
#############################

echo "**** Begin installing k3s"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE="644" sh -
echo "**** End installing k3s"

# #############################
# # 0 - Install HELM
# #############################

sudo yum install git -y
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh
echo "**** End Installing Helm"

sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chmod 644 $HOME/.kube/config

# # #################################################
# # 0 - Example Deploy with HELM
# #################################################

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update
# helm install bitnami/mysql --generate-name
# helm list

#################################################
# 0 - Deploy Stack Automation - deploy with HELM
#################################################

