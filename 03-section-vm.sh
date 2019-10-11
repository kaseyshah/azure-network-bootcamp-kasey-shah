# section 3 - Virtual Machine (VM)
# create vm-s10v10
az vm create -n vm-s10v10 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet10 \
    --subnet s10v10 \
    --location westus2 \
    --nsg nsg-ssh-rdp-web-westus2 \
    --zone 1
# display public IP
az vm show -g rsg-aznetw -n vm-s10v10 -d --query [publicIps]
# create vm-s20v10
az vm create -n vm-s20v10 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet10 \
    --subnet s20v10 \
    --location westus2 \
    --nsg nsg-ssh-rdp-web-westus2 \
    --zone 2
# display public IP
az vm show -g rsg-aznetw -n vm-s20v10 -d --query [publicIps]
#
#
# create vm-s10v20
az vm create -n vm-s10v20 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet20 \
    --subnet s10v20 \
    --location eastus \
    --nsg nsg-ssh-rdp-web-eastus \
    --zone 1
# display public IP
az vm show -g rsg-aznetw -n vm-s10v20 -d --query [publicIps]
# create vm-s20v10
az vm create -n vm-s20v20 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet20 \
    --subnet s20v20 \
    --location eastus \
    --nsg nsg-ssh-rdp-web-eastus \
    --zone 2
# display public IP
az vm show -g rsg-aznetw -n vm-s20v20 -d --query [publicIps]
#
#
# create vm-s10v30
az vm create -n vm-s10v30 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet30 \
    --subnet s10v30 \
    --location westeurope \
    --nsg nsg-ssh-rdp-web-westeurope \
    --zone 1
# display public IP
az vm show -g rsg-aznetw -n vm-s10v30 -d --query [publicIps]
# create vm-s20v30
az vm create -n vm-s20v30 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet30 \
    --subnet s20v30 \
    --location westeurope \
    --nsg nsg-ssh-rdp-web-westeurope \
    --zone 2
# display public IP
az vm show -g rsg-aznetw -n vm-s20v30 -d --query [publicIps]
#
#
# create vm-s10v40
az vm create -n vm-s10v40 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet40 \
    --subnet s10v40 \
    --location southeastasia \
    --nsg nsg-ssh-rdp-web-southeastasia \
    --zone 1
# display public IP
az vm show -g rsg-aznetw -n vm-s10v40 -d --query [publicIps]
# create vm-s20v40
az vm create -n vm-s20v40 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --vnet-name vnet40 \
    --subnet s20v40 \
    --location southeastasia \
    --nsg nsg-ssh-rdp-web-southeastasia \
    --zone 2
# display public IP
az vm show -g rsg-aznetw -n vm-s20v40 -d --query [publicIps]