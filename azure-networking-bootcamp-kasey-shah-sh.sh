# Kasey's Azure Networking Bootcamp solution
# GitHub location is: 
# 
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
#creating two subnets in vnet30
az network vnet subnet create -n s10v30 -g rsg-aznetw --vnet-name vnet30 --address-prefix 10.30.10.0/24
az network vnet subnet create -n s20v30 -g rsg-aznetw --vnet-name vnet30 --address-prefix 10.30.20.0/24
#
# create vnet40
az network vnet create -g rsg-aznetw -n vnet40 --address-prefix 10.40.0.0/16 -l southeastasia
#creating two subnets in vnet40
az network vnet subnet create -n s10v40 -g rsg-aznetw --vnet-name vnet40 --address-prefix 10.40.10.0/24
az network vnet subnet create -n s20v40 -g rsg-aznetw --vnet-name vnet40 --address-prefix 10.40.20.0/24
#
# create vm-s10v10
az vm create -n vm-s10v10 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet10 \
    --subnet s10v10 \
    --location westus2 \
    --zone 1
#
# create vm-s20v10
az vm create -n vm-s20v10 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet10 \
    --subnet s20v10 \
    --location westus2 \
    --zone 2
#
# create vm-s10v20
az vm create -n vm-s10v20 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet20 \
    --subnet s10v20 \
    --location eastus \
    --public-ip-sku standard \
    --zone 1
#
# create vm-s20v20
az vm create -n vm-s20v20 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet20 \
    --subnet s20v20 \
    --location eastus \
    --public-ip-sku standard \
    --zone 2
#
# create vm-s10v30
az vm create -n vm-s10v30 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet30 \
    --subnet s10v30 \
    --location westeurope \
    --zone 1 \
    --no-wait
#
# create vm-s20v30
az vm create -n vm-s20v30 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet30 \
    --subnet s20v30 \
    --location westeurope \
    --zone 2
#
# create vm-s10v40
az vm create -n vm-s10v40 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet40 \
    --subnet s10v40 \
    --location southeastasia \
    --zone 1
#
# create vm-s20v40
az vm create -n vm-s20v40 -g rsg-aznetw \
    --authentication-type password \
    --admin-username kasey \
    --admin-password Microsoft@123 \
    --generate-ssh-keys \
    --image UbuntuLTS \
    --public-ip-address-allocation static \
    --vnet-name vnet40 \
    --subnet s20v40 \
    --location southeastasia \
    --zone 2
#
# create vm scaleset with load balancer
 az vmss create \
  --resource-group rsg-aznetw \
  --name vmss01 \
  --vnet-name vnet10 \
  --subnet s10v10 \
  --image UbuntuLTS \
  --upgrade-policy-mode automatic \
  --admin-username kasey \
  --admin-password Microsoft@123 \
  --generate-ssh-keys \
  --load-balancer lb-vmss01 \
  --zones 1 2 3
#
# vnet peering from vnet10 to vnet20
az network vnet peering create \
    --resource-group rsg-aznetw \
    --name vnet10-to-vnet20 \
    --vnet-name vnet10 \
    --remote-vnet vnet20 \
    --allow-vnet-access
# vnet peering from vnet20 to vnet10
az network vnet peering create \
    --resource-group rsg-aznetw \
    --name vnet20-to-vnet10 \
    --vnet-name vnet20 \
    --remote-vnet vnet10 \
    --allow-vnet-access
# peer vnet20 to vnet10, vnet30, and vnet40
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
# Deploy Cisco CSR 1000V solution from Azure marketplace
# portal, add service, search cisco 1000v, select Cisco CSR 1000v solution, create, follow prompts.
# From the portal locate public IP address of this Cisco CSR 1000v and save it in a variable. Replace X.Y.Z.A below with the real IP
export RouterIPSite1 = X.Y.Z.A
# Begin VPN from customer site to VPN gateway in vnet20
#
# create gateway subnet in vnet20
az network vnet subnet create \
    --address-prefix 10.20.255.0/27 \
    --name GatewaySubnet \
    --resource-group rsg-aznetw \
    --vnet-name vnet20
#
# create local gw representing on-prem router; replace public ip below with on-prem router ip.
# for simulation use Cisco 1000V solution and use outside interface public ip.
az network local-gateway create \
    --gateway-ip-address 23.99.221.164 \
    --name onprem-site1 \
    --resource-group rsg-aznetw \
    --local-address-prefixes 192.168.10.0/24 192.168.20.0/24
#
# request public ip for vpn gateway
az network public-ip create \
    --name vpngwip-vnet20 \
    --resource-group rsg-aznetw \
    --allocation-method dynamic \
    --location eastus
#
# create vpn gateway in vnet20
az network vnet-gateway create \
    --name vpngw-vnet20 \
    --public-ip-address vpngwip-vnet20 \
    --resource-group rsg-aznetw \
    --vnet vnet20 \
    --gateway-type Vpn \
    --vpn-type RouteBased \
    --sku VpnGw1 \
    --location eastus \
    --no-wait
# view vpn gw
az network vnet-gateway show -n vpngw-vnet20 -g rsg-aznetw
# view public ip status of vpn gw
az network public-ip show --name vpngwip-vnet20 -g rsg-aznetw
# create a vpn connection
az network vpn-connection create \
    --name onprem-site1-to-vpngw-vnet20 \
    --resource-group rsg-aznetw \
    --vnet-gateway1 vpngw-vnet20 \
    -l eastus \
    --shared-key abc123 \
    --local-gateway2 onprem-site1
# show vpn connection
az network vpn-connection show \
    --name onprem-site1-to-vpngw-vnet20 \
    --resource-group rsg-aznetw
#
# End VPN from customer site to VPN gateway in vnet20
#
# beginning of blob storage tasks
# create a storage account first
az storage account create \
    --location westus2 \
    --name kasey-sa22 \
    --resource-group rsg-aznetw \
    --sku lrs
# create a storage container
az storage container create --name kasey-sc22
# upload a file to this blob
az storage blob upload \
    --file mynameiskasey.txt \
    --container-name kasey-sc22 \
    --name kaseyshah
# list blobs in a storage container
az storage blob list \
    --container-name kasey-sc22 \
    --output table
# delete a blob
# az storage blob delete --container-name kasey-sc22 --name mynameiskasey.txt
# delete storage container
# az storage container delete --name kasey-sc22
# delete storage account
# az storage account delete --name kasey-sa22 --resource-group rsg-aznetw
#
# end of blob storage tasks
#
# Beginning of Azure SQL bootcamp tasks
#
# Create a logical server in the resource group
az sql server create \
    --name kasey-sqlsrv01 \
    --resource-group rsg-aznetw \
    --location westus2  \
    --admin-user kasey \
    --admin-password Microsoft@123
#
# Configure a firewall rule for the server
az sql server firewall-rule create \
    --resource-group rsg-aznetw \
    --server kasey-sqlsrv01 \
    --name AllowYourIp \
    --start-ip-address 0.0.0.0 \
    --end-ip-address 0.0.0.0

# Create a database in the server with zone redundancy as false
az sql db create \
    --resource-group rsg-aznetw \
    --server kasey-sqlsrv01 \
    --name mySampleDatabase \
    --sample-name AdventureWorksLT \
    --edition GeneralPurpose \
    --family Gen4 \
    --capacity 1 \
    --zone-redundant false
# find out FQDN of SQL server to login to
az sql server show -n kasey-sqlsrv01 -g rsg-aznetw -o json
# alternatively use this command
az sql server show -n kasey-sqlsrv01 -g rsg-aznetw --query 'fullyQualifiedDomainName' -o tsv
# access the above sql server with the SQL Server Management Studio Windows program
# add a few records to the sample DB
# End of Azure SQL bootcamp tasks
# 
# Beginnig of Azure Virtual WAN (VWAN) bootcamp tasks
#
# create virtual WAN
# this takes 45 minutes
az network vwan create --name kasey-vwan --resource-group rsg-aznetw
# Create Vwan Hub
az network vhub create --address-prefix 10.40.200.0/24 \
    --name kasey-vhub \
    --resource-group rsg-aznetw \
    --vwan kasey-vwan \
    --location southeastasia
# create vpn gateway inside vwan
az network vpn-gateway create --name kasey-vwan-vpngw \
    --resource-group rsg-aznetw \
    --vhub kasey-vhub \
    --location southeastasia
# create a remote site; replace ip address below to actual public IP of the remote site router
az network vpn-site create \
    --ip-address 1.2.3.4
    --name vwan-to-site1 \
    --resource-group rsg-aznetw \
    -- location southeastasia
# create vpn connection to remote site
az network vpn-gateway connection create --gateway-name
    --name vpnconnection-to-site1 \
    --remote-vpn-site vwan-to-site1 \
    --resource-group rsg-aznetw \
    --location southeastasia
#
# Begin Load Balancer LB1 tasks
#
# Create a zonal Standard public IP address.
   az network public-ip create \
    --resource-group rsg-aznetw \
    --name myPublicIP \
    --sku Standard    
#
# Create an Azure Load Balancer.
   az network lb create \
    --resource-group rsg-aznetw \
    --name myLoadBalancer \
    --public-ip-address myPublicIP \
    --frontend-ip-name myFrontEndPool \
    --backend-pool-name myBackEndPool \
    --sku Standard
#
# Creates an LB probe on port 80.
   az network lb probe create \
    --resource-group rsg-aznetw \
    --lb-name myLoadBalancer \
    --name myHealthProbe \
    --protocol tcp \
    --port 80
#
# Creates an LB rule for port 80.
   az network lb rule create \
    --resource-group rsg-aznetw \
    --lb-name myLoadBalancer \
    --name myLoadBalancerRuleWeb \
    --protocol tcp \
    --frontend-port 80 \
    --backend-port 80 \
    --frontend-ip-name myFrontEndPool \
    --backend-pool-name myBackEndPool \
    --probe-name myHealthProbe
#
# Create three NAT rules for port 22.
   for i in `seq 1 3`; do
    az network lb inbound-nat-rule create \
     --resource-group rsg-aznetw \
     --lb-name myLoadBalancer \
     --name myLoadBalancerRuleSSH$i \
     --protocol tcp \
     --frontend-port 422$i \
     --backend-port 22 \
     --frontend-ip-name myFrontEndPool
   done
#
# Create a network security group
   az network nsg create \
    --resource-group rsg-aznetw \
    --name myNetworkSecurityGroup
#
# Create a network security group rule for port 22.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name myNetworkSecurityGroup \
    --name myNetworkSecurityGroupRuleSSH \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 22 \
    --access allow \
    --priority 1000
#
# Create a network security group rule for port 80.
    az network nsg rule create \
     --resource-group rsg-aznetw \
     --nsg-name myNetworkSecurityGroup \
     --name myNetworkSecurityGroupRuleHTTP \
     --protocol tcp \
     --direction inbound \
     --source-address-prefix '*' \
     --source-port-range '*' \
     --destination-address-prefix '*' \
     --destination-port-range 80 \
     --access allow \
     --priority 2000
#
# Create three virtual network cards and associate with load balancer and NSG.
  for i in `seq 1 3`; do
   az network nic create \
     --resource-group rsg-aznetw \
     --name myNic$i \
     --vnet-name vnet10 \
     --subnet s10v10 \
     --network-security-group myNetworkSecurityGroup \
     --lb-name myLoadBalancer \
     --lb-address-pools myBackEndPool \
     --lb-inbound-nat-rules myLoadBalancerRuleSSH$i
  done
#
# Create three virtual machines, this creates SSH keys if not present.
for i in `seq 1 3`; do
  az vm create \
    --resource-group rsg-aznetw \
    --name myVM$i \
    --zone $i \
    --nics myNic$i \
    --image UbuntuLTS \
    --generate-ssh-keys \
    --no-wait
done
#
# visit public IP of LB1, refresh to see it bouncing between vm1, vm2, and vm3
# Traffic Manager
# route traffic based on priority to the webapp
#
az network traffic-manager profile create \
	--name kasey-atm-profile1 \
	--resource-group rsg-aznetw \
	--routing-method Priority \
	--path "/" \
	--protocol HTTP \
	--unique-dns-name <profile_name> \
	--ttl 30 \
	--port 80
#
az appservice plan create \
    --name kasey-asp-eastus \
    --resource-group rsg-aznetw \
    --location eastus \
    --sku S1
#
az appservice plan create \
    --name kasey-asp-westeurope \
    --resource-group rsg-aznetw \
    --location westeurope \
    --sku S1
#
az webapp create \
    --name kasey-web-eastus \
    --plan kasey-asp-eastus \
    --resource-group rsg-aznetw
#
az webapp create \
    --name kasey-web-westeurope \
    --plan kasey-asp-westeurope \
    --resource-group rsg-aznetw
# add TM endpoints
#
az webapp show \
    --name kasey-web-eastus \
    --resource-group rsg-aznetw \
    --query id
#
az network traffic-manager endpoint create \
    --name kasey-atm-ep-eastus \
    --resource-group rsg-aznetw \
    --profile-name kasey-atm-profile1 \
    --type azureEndpoints \
    --target-resource-id <ID from az webapp show> \
    --priority 1 \
    --endpoint-status Enabled
#
az webapp show \
    --name kasey-web-westeurope \
    --resource-group rsg-aznetw \
    --query id
#
az network traffic-manager endpoint create \
    --name kasey-atm-ep-westeurope \
    --resource-group rsg-aznetw \
    --profile-name kasey-atm-profile1 \
    --type azureEndpoints \
    --target-resource-id <ID from az webapp show> \
    --priority 2 \
    --endpoint-status Enabled
#
az network traffic-manager profile show \
    --name kasey-atm-profile1 \
    --resource-group rsg-aznetw \
    --query dnsConfig.fqdn
#
# visit the website shown above
# down webapp in eastus
#
az network traffic-manager endpoint update \
     --name kasey-atm-ep-eastus \
     --resource-group rsg-aznetw \
     --profile-name az-atm-profile1 \
     --type azureEndpoints \
     --endpoint-status Disabled
# revisit the same URL


                       

