# section 1: Vnet
# create resource group
az group create -n rsg-aznetw -l westus2
#
# command to list regions is 
az account list-locations
#
# create vnet10
az network vnet create -g rsg-aznetw -n vnet10 --address-prefix 10.10.0.0/16 -l westus2
#creating two subnets in vnet10
az network vnet subnet create -n s10v10 -g rsg-aznetw --vnet-name vnet10 --address-prefix 10.10.10.0/24
az network vnet subnet create -n s20v10 -g rsg-aznetw --vnet-name vnet10 --address-prefix 10.10.20.0/24
#
# create vnet20
az network vnet create -g rsg-aznetw -n vnet20 --address-prefix 10.20.0.0/16 -l eastus
#creating two subnets in vnet20
az network vnet subnet create -n s10v20 -g rsg-aznetw --vnet-name vnet20 --address-prefix 10.20.10.0/24
az network vnet subnet create -n s20v20 -g rsg-aznetw --vnet-name vnet20 --address-prefix 10.20.20.0/24
#
# create vnet30
az network vnet create -g rsg-aznetw -n vnet30 --address-prefix 10.30.0.0/16 -l westeurope
# creating two subnets in vnet30
az network vnet subnet create -n s10v30 -g rsg-aznetw --vnet-name vnet30 --address-prefix 10.30.10.0/24
az network vnet subnet create -n s20v30 -g rsg-aznetw --vnet-name vnet30 --address-prefix 10.30.20.0/24
#
# create vnet40
az network vnet create -g rsg-aznetw -n vnet40 --address-prefix 10.40.0.0/16 -l southeastasia
#creating two subnets in vnet40
az network vnet subnet create -n s10v40 -g rsg-aznetw --vnet-name vnet40 --address-prefix 10.40.10.0/24
az network vnet subnet create -n s20v40 -g rsg-aznetw --vnet-name vnet40 --address-prefix 10.40.20.0/24
#
# peer vnet20 to vnet10, vnet30, and vnet40
#
# vnet peering from vnet10 to vnet20
az network vnet peering create \
    -g rsg-aznetw \
    -n vnet10-to-vnet20 \
    --vnet-name vnet10 \
    --remote-vnet vnet20 \
    --allow-vnet-access
# vnet peering from vnet20 to vnet30
az network vnet peering create \
    -g rsg-aznetw \
    -n vnet20-to-vnet30 \
    --vnet-name vnet20 \
    --remote-vnet vnet30 \
    --allow-vnet-access
# vnet peering from vnet30 to vnet20
az network vnet peering create \
    -g rsg-aznetw \
    -n vnet30-to-vnet20 \
    --vnet-name vnet30 \
    --remote-vnet vnet20 \
    --allow-vnet-access
#
# vnet peering from vnet20 to vnet40
az network vnet peering create \
    -g rsg-aznetw \
    -n vnet20-to-vnet40 \
    --vnet-name vnet20 \
    --remote-vnet vnet40 \
    --allow-vnet-access
# vnet peering from vnet40 to vnet20
az network vnet peering create \
    -g rsg-aznetw \
    -n vnet40-to-vnet20 \
    --vnet-name vnet40 \
    --remote-vnet vnet20 \
    --allow-vnet-access
#
az network vnet list -g rsg-aznetw 
az network vnet show -g rsg-aznetw -n vnet10
