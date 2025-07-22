#########################################################################################
#                                                                                       #
# This sample defines a deployment that will create the networks and their subnets      #
#                                                                                       #
#########################################################################################

#########################################################################################
#                                                                                       #
# The automation framework supports both creating resources (greenfield) or using       #
# existing resources (brownfield).                                                      #
#                                                                                       #
# For the greenfield scenario the automation defines default names for resources,       #
# if there is a XXXXname variable then the name is customizable.                        #
#                                                                                       #
# For the brownfield scenario the Azure resource identifiers for the resources must     #
# be specified.                                                                         #
#                                                                                       #
#########################################################################################

#########################################################################################
#                                                                                       #
#  Environment definitions                                                              #
#                                                                                       #
#########################################################################################

# The environment value is a mandatory field, it is used for partitioning the environments, for example (PROD and NP)
environment="@@ENV@@"

# The location value is a mandatory field, it is used to control where the resources are deployed
location="@@REGION@@"

# The network logical name is mandatory - it is used in the naming convention and should map to the workload virtual network logical name
network_logical_name="@@VNET@@"

# network_address_space is a mandatory parameter when an existing virtual network is not used
network_address_space=["10.110.0.0/16"]

# admin_subnet_address_prefix is a mandatory parameter if the subnets are not defined in the workload or if existing subnets are not used
admin_subnet_address_prefix="10.110.0.0/19"

# db_subnet_address_prefix is a mandatory parameter if the subnets are not defined in the workload or if existing subnets are not used
db_subnet_address_prefix="10.110.96.0/19"

# app_subnet_address_prefix is a mandatory parameter if the subnets are not defined in the workload or if existing subnets are not used
app_subnet_address_prefix="10.110.32.0/19"

# The automation_username defines the user account used by the automation
automation_username="azureadm"

# Boolean value indicating if service endpoints should be used for the deployment
use_service_endpoint = true

# Boolean value indicating if private endpoint should be used for the deployment
use_private_endpoint = true

# Defines if access to the key vaults and storage accounts is restricted to the SAP and deployer VNets
enable_firewall_for_keyvaults_and_storage = true

# Defines if public access is allowed for the storage accounts and key vaults
public_network_access_enabled = false

# enable_rbac_authorization_for_keyvault Controls the access policy model for the workload zone keyvault.
enable_rbac_authorization_for_keyvault = true

#########################################################################################
#                                                                                       #
#  Private DNS support                                                                  #                                                                                       #
#                                                                                       #
#########################################################################################

# If defined provides the DNS label for the Virtual Network
dns_label = "sdaf.contoso.net"

# If defined provides the list of DNS servers to attach to the Virtual NEtwork
#dns_server_list = []

#########################################################################################
#                                                                                       #
#  DNS Settings                                                                         #
#                                                                                       #
#########################################################################################


# Subscription for the resource group containing the Private DNS zone for the compute resources
#management_dns_subscription_id = ""

# Resource group name for the resource group containing the Private DNS zone for the compute resources
#management_dns_resourcegroup_name = ""

# Subscription for the resource group containing the Private DNS zone for the Privatelink resources
#privatelink_dns_subscription_id = ""

# Resource group name for the resource group containing the Private DNS zone for the Privatelink resources
#privatelink_dns_resourcegroup_name = ""

# Defines if a custom dns solution is used
use_custom_dns_a_registration = false

# Defines if the Virtual network for the Virtual Machines is registered with DNS
# This also controls the creation of DNS entries for the load balancers
register_virtual_network_to_dns = true

# register_endpoints_with_dns defines if the endpoints should be registered with the DNS
register_endpoints_with_dns = true

#########################################################################################
#                                                                                       #
#  Storage account details                                                               #
#                                                                                       #
#########################################################################################


# Defines the size of the install volume
#install_volume_size = 1536

# install_storage_account_id defines the Azure resource id for the install storage account
#install_storage_account_id = ""

# azurerm_private_endpoint_connection_install_id defines the Azure resource id for the install storage account's private endpoint connection
#install_private_endpoint_id = ""

# create_transport_storage defines if the workload zone will host storage for the transport data
#create_transport_storage = true

# Defines the size of the transport volume
#transport_volume_size = 0

# azure_files_transport_storage_account_id defines the Azure resource id for the transport storage account
#transport_storage_account_id = ""

# azurerm_private_endpoint_connection_transport_id defines the Azure resource id for the transport storage accounts private endpoint connection
#transport_private_endpoint_id = ""


# $diagnostics_storage_account_arm_id defines the Azure resource id for the diagnostics storage accounts
#diagnostics_storage_account_arm_id = ""

# witness_storage_account_arm_id defines the Azure resource id for the witness storage accounts
#witness_storage_account_arm_id = ""

# storage_account_replication_type defines the replication type for Azure Files for NFS storage accounts
#storage_account_replication_type = "LRS"

# shared_access_key_enabled defines Storage account authorization using Shared Access Key.
shared_access_key_enabled = false

# shared_access_key_enabled_nfs defines Storage account used for NFS shares authorization using Shared Access Key.
shared_access_key_enabled_nfs = false

# Value indicating if file shares are created when using existing storage accounts
install_always_create_fileshares = true

# Value indicating if SMB shares should be created
install_create_smb_shares = true


#########################################################################################
#                                                                                       #
#  NFS support                                                                          #
#                                                                                       #
#########################################################################################

# NFS_Provider defines how NFS services are provided to the SAP systems, valid options are "ANF", "AFS", "NFS" or "NONE"
# AFS indicates that Azure Files for NFS is used
# ANF indicates that Azure NetApp Files is used
# NFS indicates that a custom solution is used for NFS
#NFS_provider = "AFS"

# use_AFS_for_shared_storage defines if shared media is on AFS even when using ANF for data
#use_AFS_for_shared_storage = true

#########################################################################################
#                                                                                       #
#  Azure NetApp files support                                                           #
#                                                                                       #
#########################################################################################

# ANF_account_name is the name for the Netapp Account
#ANF_account_name = ""

# ANF_service_level is the service level for the NetApp pool
#ANF_service_level = "Ultra"

# ANF_pool_name is the ANF pool name
#ANF_pool_name = ""

# ANF_pool_size is the pool size in TB for the NetApp pool
#ANF_pool_size = 0

# ANF_qos_type defines the Quality of Service type of the pool (Auto or Manual)
#ANF_qos_type = "Manual"

# ANF_account_arm_id is the Azure resource identifier for an existing Netapp Account
#ANF_account_arm_id = ""

# ANF_use_existing_pool defines if an existing pool is used
#ANF_use_existing_pool = false

#########################################################################################
#                                                                                       #
#  Transport ANF Volume                                                                 #
#                                                                                       #
#########################################################################################

# ANF_transport_volume_use_existing defines if an existing volume is used for transport
#ANF_transport_volume_use_existing = false

# ANF_transport_volume_name is the name of the transport volume
#ANF_transport_volume_name = ""

# ANF_transport_volume_throughput is the throughput for the transport volume
#ANF_transport_volume_throughput = 0

# ANF_transport_volume_size is the size for the transport volume
#ANF_transport_volume_size = 0

# ANF_transport_volume_zone is the zone for the transport volume
#ANF_transport_volume_zone = []

#########################################################################################
#                                                                                       #
#  Install ANF Volume                                                                   #
#                                                                                       #
#########################################################################################

# ANF_install_volume_use_existing defines if an existing volume is used for install
#ANF_install_volume_use_existing = false

# ANF_install_volume_name is the name of the install volume
#ANF_install_volume_name = ""

# ANF_install_volume_throughput is the throughput for the install volume
#ANF_install_volume_throughput = 0

# ANF_install_volume_size is the size for the install volume
#ANF_install_volume_size = 0

# ANF_install_volume_zone is the zone for the transport volume
#ANF_install_volume_zone = []

###########################################################################
#                                                                         #
#                                ISCSI Devices                            #
#                                                                         #
###########################################################################

# Number of iSCSI devices to be created
#iscsi_count = 3

# Size of iSCSI Virtual Machines to be created
#iscsi_size = "Standard_D2s_v3"

# Defines if the iSCSI devices use DHCP
#iscsi_useDHCP = true

# Defines the Virtual Machine image for the iSCSI devices
# iscsi_image = {
#   os_type = "LINUX",
#   source_image_id = "",
#   publisher = "RedHat",
#   offer = "RHEL",
#   sku = "92-gen2",
#   version = "latest",
#   type = "marketplace"
# }

# Defines the Virtual Machine authentication type for the iSCSI devices
#iscsi_authentication_type = "key"

# Defines the username for the iSCSI devices
#iscsi_authentication_username = "azureadm"

# Defines the IP Addresses for the iSCSI devices
#iscsi_nic_ips = []

# Defines the Availability zones for the iSCSI devices
#iscsi_vm_zones = ["1", "2", "3"]

#########################################################################################
#                                                                                       #
#  Terraform deployment parameters                                                      #
#                                                                                       #
#########################################################################################

# These are required parameters, if using the deployment scripts they will be auto populated otherwise they need to be entered

# tfstate_resource_id is the Azure resource identifier for the Storage account in the SAP Library
# that will contain the Terraform state files
#tfstate_resource_id = ""

# deployer_tfstate_key is the state file name for the deployer
#deployer_tfstate_key = ""


#########################################################################################
#                                                                                       #
#  Utility VM definitions                                                              #
#                                                                                       #
#########################################################################################


# Defines the number of workload _vms to create
#utility_vm_count = 0

# Defines the SKU for the workload virtual machine
#utility_vm_size = ""

# Defines the size of the OS disk for the Virtual Machine
#utility_vm_os_disk_size = "128"

# Defines the type of the OS disk for the Virtual Machine
#utility_vm_os_disk_type = "Premium_LRS"


# Defines if the utility virtual machine uses DHCP
#utility_vm_useDHCP = true

# Defines if the utility virtual machine image
# utility_vm_image = {
#   os_type = "WINDOWS",
#   source_image_id = "",
#   publisher = "MicrosoftWindowsServer",
#   offer = "windowsserver",
#   sku = "2022-datacenter-g2",
#   version = "latest",
#   type = "marketplace"
# }

# Defines if the utility virtual machine IP
#utility_vm_nic_ips = []

############################################################################################
#                                                                                          #
#                                  Tags for all resources                                  #
#                                                                                          #
############################################################################################

# These tags will be applied to all resources
# tags = {
#   "azsecpack" = "nonprod",
#   "platformsettings.host_environment.service.platform_optedin_for_rootcerts" = "true",
#   "owner" = "",
# }

############################################################################################
#                                                                                          #
#                                  AMS Configuration                                       #
#                                                                                          #
############################################################################################

# If true, an AMS instance will be created
#create_ams_instance = true

# ams_instance_name If provided, the name of the AMS instance
#ams_instance_name = ""

# ams_laws_arm_id if provided, Azure resource id for the Log analytics workspace in AMS
#ams_laws_arm_id = ""

#######################################4#######################################8
#                                                                              #
#                             NAT Gateway variables                            #
#                                                                              #
#######################################4#######################################8

# If true, a NAT gateway will be created
#deploy_nat_gateway = false

# If provided, the name of the NAT Gateway
#nat_gateway_name = ""

# If provided, the Azure resource id for the NAT Gateway
#nat_gateway_arm_id = ""

# If provided, the zones for the NAT Gateway public IP
#nat_gateway_public_ip_zones = []

# If provided, Azure resource id for the NAT Gateway public IP
#nat_gateway_public_ip_arm_id = ""

# The idle timeout in minutes for the NAT Gateway
#nat_gateway_idle_timeout_in_minutes = 4

# If provided, the tags for the NAT Gateway public IP
#nat_gateway_public_ip_tags = {}
