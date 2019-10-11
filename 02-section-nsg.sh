# section 2 - NSG, ASG
# Create a network security group in westus2
   az network nsg create \
    --resource-group rsg-aznetw \
    --name nsg-ssh-rdp-web-westus2 \
    --location westus2
# Create a network security group rule for SSH TCP port 22.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-westus2 \
    --name nsgRuleSSH \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 22 \
    --access allow \
    --priority 1000
# Create a network security group rule for port RDP TCP port 3389.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-westus2 \
    --name nsgRuleRDP \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 3389 \
    --access allow \
    --priority 1010
# Create a network security group rule for HTTP TCP port 80.
    az network nsg rule create \
     --resource-group rsg-aznetw \
     --nsg-name nsg-ssh-rdp-web-westus2 \
     --name nsgRuleHTTP \
     --protocol tcp \
     --direction inbound \
     --source-address-prefix '*' \
     --source-port-range '*' \
     --destination-address-prefix '*' \
     --destination-port-range 80 \
     --access allow \
     --priority 1020
# listing NSGs in a resource group
az network nsg list -g rsg-aznetw
# listing rules of an NSG
az network nsg rule list \
    --nsg-name nsg-ssh-rdp-web-westus2 \
    --resource-group rsg-aznetw
#
#create similar NSGs in each of the other three regions
#
# Create a network security group in eastus
   az network nsg create \
    --resource-group rsg-aznetw \
    --name nsg-ssh-rdp-web-eastus \
    --location eastus
# Create a network security group rule for SSH TCP port 22.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-eastus \
    --name nsgRuleSSH \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 22 \
    --access allow \
    --priority 1000
# Create a network security group rule for port RDP TCP port 3389.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-eastus \
    --name nsgRuleRDP \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 3389 \
    --access allow \
    --priority 1010
# Create a network security group rule for HTTP TCP port 80.
    az network nsg rule create \
     --resource-group rsg-aznetw \
     --nsg-name nsg-ssh-rdp-web-eastus \
     --name nsgRuleHTTP \
     --protocol tcp \
     --direction inbound \
     --source-address-prefix '*' \
     --source-port-range '*' \
     --destination-address-prefix '*' \
     --destination-port-range 80 \
     --access allow \
     --priority 1020
# listing NSGs in a resource group
az network nsg list -g rsg-aznetw
# listing rules of an NSG
az network nsg rule list \
    --nsg-name nsg-ssh-rdp-web-eastus \
    --resource-group rsg-aznetw
#
# Create a network security group in westeurope
   az network nsg create \
    --resource-group rsg-aznetw \
    --name nsg-ssh-rdp-web-westeurope \
    --location westeurope
# Create a network security group rule for SSH TCP port 22.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-westeurope \
    --name nsgRuleSSH \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 22 \
    --access allow \
    --priority 1000
# Create a network security group rule for port RDP TCP port 3389.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-westeurope \
    --name nsgRuleRDP \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 3389 \
    --access allow \
    --priority 1010
# Create a network security group rule for HTTP TCP port 80.
    az network nsg rule create \
     --resource-group rsg-aznetw \
     --nsg-name nsg-ssh-rdp-web-westeurope \
     --name nsgRuleHTTP \
     --protocol tcp \
     --direction inbound \
     --source-address-prefix '*' \
     --source-port-range '*' \
     --destination-address-prefix '*' \
     --destination-port-range 80 \
     --access allow \
     --priority 1020
# listing NSGs in a resource group
az network nsg list -g rsg-aznetw
# listing rules of an NSG
az network nsg rule list \
    --nsg-name nsg-ssh-rdp-web-westeurope \
    --resource-group rsg-aznetw
#
# Create a network security group in southeastasia
   az network nsg create \
    --resource-group rsg-aznetw \
    --name nsg-ssh-rdp-web-southeastasia \
    --location southeastasia
# Create a network security group rule for SSH TCP port 22.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-southeastasia \
    --name nsgRuleSSH \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 22 \
    --access allow \
    --priority 1000
# Create a network security group rule for port RDP TCP port 3389.
   az network nsg rule create \
    --resource-group rsg-aznetw \
    --nsg-name nsg-ssh-rdp-web-southeastasia \
    --name nsgRuleRDP \
    --protocol tcp \
    --direction inbound \
    --source-address-prefix '*' \
    --source-port-range '*'  \
    --destination-address-prefix '*' \
    --destination-port-range 3389 \
    --access allow \
    --priority 1010
# Create a network security group rule for HTTP TCP port 80.
    az network nsg rule create \
     --resource-group rsg-aznetw \
     --nsg-name nsg-ssh-rdp-web-southeastasia \
     --name nsgRuleHTTP \
     --protocol tcp \
     --direction inbound \
     --source-address-prefix '*' \
     --source-port-range '*' \
     --destination-address-prefix '*' \
     --destination-port-range 80 \
     --access allow \
     --priority 1020
# listing NSGs in a resource group
az network nsg list -g rsg-aznetw
# listing rules of an NSG
az network nsg rule list \
    --nsg-name nsg-ssh-rdp-web-southeastasia \
    --resource-group rsg-aznetw
#


