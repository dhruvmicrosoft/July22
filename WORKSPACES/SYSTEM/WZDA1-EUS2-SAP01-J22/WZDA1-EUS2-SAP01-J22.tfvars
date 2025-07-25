#########################################################################################
#                                                                                       #
# Deployment topologies                                                                 #
#                                                                                       #
# Standard (All roles on same server)                                                   #
#  Define the database tier values and set enable_app_tier_deployment to false          #
#                                                                                       #
# Distributed (1+1 or 1+1+N)                                                            #
#  Define the database tier values and define scs_server_count = 1,                     #
#  application_server_count >= 1                                                        #
#                                                                                       #
# High Availability                                                                     #
#  Define the database tier values and database_high_availability = true                #
#  scs_server_count = 1 and scs_high_availability = true                                #
#  application_server_count >= 1                                                        #
#                                                                                       #
# The automation supports both creating resources (greenfield) or using existing        #
# resources (brownfield).                                                               #
#                                                                                       #
# For the greenfield scenario the automation defines default names for resources,       #
# if there is a XXXXname variable then the name is customizable.                        #
# For the brownfield scenario the Azure resource identifiers for the resources must     #
# be specified using the XXXX_armid fields.                                             #
#                                                                                       #
#########################################################################################

#########################################################################################
#                                                                                       #
#  Environment/Application definitions                                                  #
#                                                                                       #
#########################################################################################

# The environment value is a mandatory field, it is used for partitioning the environments, for example (PROD and NP)
environment = "WZDA1"

# The location value is a mandatory field, it is used to control where the resources are deployed
location = "eastus2"


# The subscription ID is used to control where the resources are deployed
#subscription_id = ""

# The sid value is a mandatory field that defines the SAP Application SID
sid = "J22"

# The database_sid defines the database SID
#database_sid = ""

# The database_platform defines the database backend, supported values are
# - HANA
# - DB2
# - ORACLE
# - ORACLE-ASM
# - SYBASE
# - SQLSERVER
# - NONE (in this case no database tier is deployed)
database_platform = "HANA"

# Description of the SAP system.
#Description = ""

#########################################################################################
#                                                                                       #
#  Deployment parameters                                                                #
#                                                                                       #
#########################################################################################


# If you want to provide a custom naming json use the following parameter.
#name_override_file = ""

# If you want to customize the disk sizes for VMs use the following parameter to specify the custom sizing file.
#custom_disk_sizes_filename = ""

# use_secondary_ips controls if the virtual machines should be deployed with two IP addresses. Required for SAP Virtual Hostname support
use_secondary_ips = false

# use_scalesets_for_deployment defines if Flexible Virtual Machine Scale Sets are used for the deployment
use_scalesets_for_deployment = false

# scaleset_id defines the scale set Azure resource Id
#scaleset_id = ""

# database_use_premium_v2_storage defines if the database tier will use premium v2 storage
database_use_premium_v2_storage = false

# upgrade_packages defines if all packages should be upgraded after installation
upgrade_packages = true

#########################################################################################
#                                                                                       #
#  Database tier                                                                        #                                                                                       #
#                                                                                       #
#########################################################################################

# Defines the number of database servers
database_server_count = 1

# database_high_availability is a boolean flag controlling if the database tier is deployed highly available (more than 1 node)
database_high_availability = false

# For M series VMs use the SKU name for instance "M32ts"
# If using a custom disk sizing populate with the node name for Database you have used in the file custom_disk_sizes_filename
database_size = "E20ds_v5"

# database_vm_sku, if provided defines the Virtual Machine SKU to use for the database virtual machines"
#database_vm_sku = ""

# database_instance_number if provided defines the instance number of the HANA database
#database_instance_number = ""

# database_vm_use_DHCP is a boolean flag controlling if Azure subnet provided IP addresses should be used (true)
database_vm_use_DHCP = true

# Optional, Defines if the database server will have two network interfaces
#database_dual_nics = false

# database_vm_db_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the database subnet
#database_vm_db_nic_ips = []

# database_vm_db_nic_secondary_ips, if provided provides the secondary static IP addresses
# for the network interface cards connected to the application subnet
#database_vm_db_nic_secondary_ips = []

# database_vm_admin_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the admin subnet
#database_vm_admin_nic_ips = []

# database_loadbalancer_ips defines the load balancer IP addresses for the database tier's load balancer.
#database_loadbalancer_ips = []

# database_vm_admin_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the storage subnet
#database_vm_storage_nic_ips = []

# Sample Images for different database backends

# Oracle
#database_vm_image = {
#  os_type         = "LINUX"
#  source_image_id = ""
#  publisher       = "Oracle"
#  offer           = "Oracle-Linux",
#  sku             = "82-gen2",
#  version         = "latest"
#  type            = "marketplace"
#}

#SUSE 15 SP3
#database_vm_image = {
#  os_type         = "LINUX"
#  source_image_id = ""
#  publisher       = "SUSE"
#  offer           = "sles-sap-15-sp3"
#  sku             = "gen2"
#  version         = "latest"
#  type            = "marketplace"
#}

#RedHat
#database_vm_image={
#  os_type         = "LINUX"
#  source_image_id = ""
#  publisher       = "RedHat"
#  offer           = "RHEL-SAP-HA"
#  sku             = "8_4"
#  version         = "latest"
#  type            = "marketplace"
#}

# The vm_image defines the Virtual machine image to use,
# if source_image_id is specified the deployment will use the custom image provided,
# in this case os_type must also be specified

database_vm_image = {
  os_type = "LINUX",
  source_image_id = "",
  publisher = "SUSE",
  offer = "sles-sap-15-sp5",
  sku = "gen2",
  version = "latest",
  type = "marketplace"
}

# database_vm_zones is an optional list defining the availability zones to deploy the database servers
database_vm_zones = ["2"]

# Optional, Defines the default authentication model for the Database VMs (key/password)
#database_vm_authentication_type = ""

# Optional, Defines the list of availability sets to deploy the Database VMs in
#database_vm_avset_arm_ids = []

# Optional, Defines the that the database virtual machines will not be placed in a proximity placement group
database_use_ppg = false

# Optional, Defines the that the database virtual machines will not be placed in an availability set
database_use_avset = false

# Optional, Defines if the tags for the database virtual machines
#database_tags = {}

# If true, database will deployed with Active/Active (read enabled) configuration, only supported for HANA
#database_active_active = false

#########################################################################################
#                                                                                       #
#  Application tier                                                                        #                                                                                       #
#                                                                                       #
#########################################################################################
# app_tier_sizing_dictionary_key defines the VM SKU and the disk layout for the application tier servers.
app_tier_sizing_dictionary_key = "Optimized"

# enable_app_tier_deployment is a boolean flag controlling if the application tier should be deployed
enable_app_tier_deployment = true

# app_tier_use_DHCP is a boolean flag controlling if Azure subnet provided IP addresses should be used (true)
app_tier_use_DHCP = true

#########################################################################################
#                                                                                       #
#  SAP Central Services                                                                 #
#                                                                                       #
#########################################################################################

# scs_server_count defines how many SCS servers to deploy
scs_server_count = 1

# scs_high_availability is a boolean flag controlling if SCS should be highly available
scs_high_availability = false

# scs_instance_number defines the instance number for SCS
scs_instance_number = "00"

# ers_instance_number defines the instance number for ERS
ers_instance_number = "01"

# pas_instance_number defines the instance number for PAS
pas_instance_number = "00"


# scs_server_zones is an optional list defining the availability zones to which deploy the SCS servers
scs_server_zones = ["2"]

# scs_server_sku, if defined provides the SKU to use for the SCS servers
#scs_server_sku = ""

# The vm_image defines the Virtual machine image to use for the application servers,
# if source_image_id is specified the deployment will use the custom image provided,
# in this case os_type must also be specified
scs_server_image = {
  os_type = "LINUX",
  source_image_id = "",
  publisher = "SUSE",
  offer = "sles-sap-15-sp5",
  sku = "gen2",
  version = "latest",
  type = "marketplace"
}

# scs_server_use_ppg defines the that the SCS virtual machines will be placed in a proximity placement group
scs_server_use_ppg = false

# scs_server_use_avset defines the that the SCS virtual machines will be placed in an availability set
scs_server_use_avset = false

# scs_server_app_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the application subnet
#scs_server_app_nic_ips = []

# scs_server_nic_secondary_ips, if provided provides the secondary static IP addresses
# for the network interface cards connected to the application subnet
#scs_server_nic_secondary_ips = []

# scs_server_app_admin_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the application subnet
#scs_server_admin_nic_ips = []

# scs_server_loadbalancer_ips, if provided provides the static IP addresses for the load balancer
# for the network interface cards connected to the application subnet
#scs_server_loadbalancer_ips = []

# scs_server_tags, if defined provides the tags to be associated to the application servers
#scs_server_tags = {}

#########################################################################################
#                                                                                       #
#  Application Servers                                                                  #
#                                                                                       #
#########################################################################################

# application_server_count defines how many application servers to deploy
application_server_count = 1

# application_server_zones is an optional list defining the availability zones to which deploy the application servers
application_server_zones = ["2"]

# application_server_sku, if defined provides the SKU to use for the application servers
#application_server_sku = ""

# app_tier_dual_nics is a boolean flag controlling if the application tier servers should have two network cards
app_tier_dual_nics = false

# application_server_app_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the application subnet
#application_server_app_nic_ips = []

# application_server_nic_secondary_ips, if provided provides the secondary static IP addresses
# for the network interface cards connected to the application subnet
#application_server_nic_secondary_ips = []

# application_server_app_admin_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the admin subnet
#application_server_admin_nic_ips = []

# If you want to customize the disk sizes for application tier use the following parameter.
#app_disk_sizes_filename = null

# Optional, Defines the default authentication model for the Applicatiuon tier VMs (key/password)
#app_tier_authentication_type = ""

# application_server_use_ppg defines the that the application server virtual machines will be placed in a proximity placement group
application_server_use_ppg = false

# application_server_use_avset defines the that the application server virtual machines will be placed in an availability set
application_server_use_avset = false

# application_server_tags, if defined provides the tags to be associated to the application servers
#application_server_tags = {}

# The vm_image defines the Virtual machine image to use for the application servers,
# if source_image_id is specified the deployment will use the custom image provided,
# in this case os_type must also be specified
application_server_image = {
  os_type = "LINUX",
  source_image_id = "",
  publisher = "SUSE",
  offer = "sles-sap-15-sp5",
  sku = "gen2",
  version = "latest",
  type = "marketplace"
}

#application_server_vm_avset_arm_ids = []

############################################################################################
#                                                                                          #
#                                  Web Dispatchers                                         #
#                                                                                          #
############################################################################################

# webdispatcher_server_count defines how many web dispatchers to deploy
webdispatcher_server_count = 0

# web_sid is the Web Dispatcher SID
#web_sid = ""

# web_instance_number defines the web instance number
web_instance_number = "00"


# webdispatcher_server_app_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the application subnet
#webdispatcher_server_app_nic_ips = []

# webdispatcher_server_nic_secondary_ips, if provided provides the secondary static IP addresses
# for the network interface cards connected to the application subnet
#webdispatcher_server_nic_secondary_ips = []

# webdispatcher_server_app_admin_nic_ips, if provided provides the static IP addresses
# for the network interface cards connected to the application subnet
#webdispatcher_server_admin_nic_ips = []

# webdispatcher_server_loadbalancer_ips, if provided provides the static IP addresses for the load balancer
# for the network interface cards connected to the application subnet
#webdispatcher_server_loadbalancer_ips = []

# webdispatcher_server_sku, if defined provides the SKU to use for the web dispatchers
#webdispatcher_server_sku = ""

# webdispatcher_server_use_ppg defines the that the Web dispatcher virtual machines will be placed in a proximity placement group
webdispatcher_server_use_ppg = false

# webdispatcher_server_use_avset defines the that the Web dispatcher virtual machines will be placed in an availability set
webdispatcher_server_use_avset = true

# webdispatcher_server_tags, if defined provides the tags to be associated to the web dispatchers
#webdispatcher_server_tags = {}

# webdispatcher_server_zones is an optional list defining the availability zones to which deploy the web dispatchers
#webdispatcher_server_zones = []

# The vm_image defines the Virtual machine image to use for the web dispatchers,
# if source_image_id is specified the deployment will use the custom image provided,
# in this case os_type must also be specified
#webdispatcher_server_image = {}


#########################################################################################
#                                                                                       #
#  Common Virtual Machine settings                                                      #
#                                                                                       #
#########################################################################################

# user_assigned_identity_id defines the user assigned identity to be assigned to the Virtual machines
#user_assigned_identity_id = ""

# vm_disk_encryption_set_id if defined defines the custom encryption key
#vm_disk_encryption_set_id = ""

# If defined, will add the Microsoft.Azure.Monitor.AzureMonitorLinuxAgent extension to the virtual machines
deploy_monitoring_extension = false

# If defined, will add the Microsoft.Azure.Security.Monitoring extension to the virtual machines
deploy_defender_extension = false

# If defined, defines the patching mode for the virtual machines
patch_mode = "ImageDefault"

# If defined, defines the mode of VM Guest Patching for the Virtual Machine
patch_assessment_mode = "ImageDefault"



#########################################################################################
#                                                                                       #
#  Cluster settings                                                                     #
#                                                                                       #
#########################################################################################

# scs_cluster_type defines cluster quorum type; AFA (Azure Fencing Agent), ASD (Azure Shared Disk), ISCSI
scs_cluster_type = "AFA"

# scs_cluster_disk_lun defines the LUN number for the SAP Central Services cluster disk
scs_cluster_disk_lun = 5

# scs_cluster_disk_size defines the size for the SAP Central Services cluster disk
scs_cluster_disk_size = 128

# scs_cluster_disk_type defines the storage_account_type of the shared disk for the SAP Central Services cluster
scs_cluster_disk_type = "Premium_ZRS"

# database_cluster_type defines cluster quorum type; AFA (Azure Fencing Agent), ASD (Azure Shared Disk), ISCSI
database_cluster_type = "AFA"

# database_cluster_disk_lun defines the LUN number for the database cluster disk
database_cluster_disk_lun = 8

# database_cluster_disk_size defines the size for the database cluster disk
database_cluster_disk_size = 128

# database_cluster_disk_type defines the storage_account_type of the shared disk for the Database cluster
database_cluster_disk_type = "Premium_ZRS"

# use_msi_for_clusters if defined will use managed service identity for the Pacemaker cluster fencing
use_msi_for_clusters = true

# fencing_role_name, If specified the role name to use for the fencing agent
#fencing_role_name = ""

# use_simple_mount specifies if Simple mounts are used (Applicable for SLES 15 SP# or newer)
use_simple_mount = false

# Configure fencing device based on the fence agent fence_kdump for both SCS and DB clusters
use_fence_kdump = false

# Default size of the kdump disk which will be attached to the VMs which are part DB cluster
use_fence_kdump_size_gb_db = 128

# Default LUN number of the kdump disk which will be attached to the VMs which are part of DB cluster
use_fence_kdump_lun_db = 8

# Default size of the kdump disk which will be attached to the VMs which are part of SCS cluster
use_fence_kdump_size_gb_scs = 64

# Default LUN number of the kdump disk which will be attached to the VMs which are part of SCS cluster
use_fence_kdump_lun_scs = 4

# If true, the SAP HANA SR cluster will be configured with SAP HANA SR - An Next Generation Interface
#use_sles_saphanasr_angi = false

#########################################################################################
#                                                                                       #
#  NFS support                                                                          #
#                                                                                       #
#########################################################################################

# NFS_Provider defines how NFS services are provided to the SAP systems, valid options are "ANF", "AFS", "NFS" or "NONE"
# AFS indicates that Azure Files for NFS is used
# ANF indicates that Azure NetApp Files is used
# NFS indicates that a custom solution is used for NFS
NFS_provider = "AFS"
# sapmnt_volume_size defines the size of the sapmnt volume in GB
#sapmnt_volume_size = 0

# azure_files_sapmnt_id defines the Resource identifier for Azure Files for NFS storage account for sapmnt
#azure_files_sapmnt_id = ""

# sapmnt_private_endpoint_id defines the Resource identifier for the private endpoint for Azure Files for NFS storage account for sapmnt
#sapmnt_private_endpoint_id = ""

# use_random_id_for_storageaccounts defines if the sapmnt storage account name will have a random suffix
use_random_id_for_storageaccounts = true

#########################################################################################
#                                                                                       #
#  ANF                                                                                  #
#                                                                                       #
#########################################################################################

# ANF_HANA_use_AVG defines if the ANF volume will be created in an Application Volume Group
ANF_HANA_use_AVG = false

# ANF_HANA_use_Zones defines if the ANF volume will be created in an Availability zones
ANF_HANA_use_Zones = true


#########################################################################################
#                                                                                       #
#  Azure NetApp Files - HANA Data                                                       #
#                                                                                       #
#########################################################################################

# ANF_HANA_data, if defined, will create Azure NetApp Files volume(s) for HANA data.
#ANF_HANA_data = false

# ANF_HANA_data_volume_size, if defined, provides the size of the HANA data volume(s).
#ANF_HANA_data_volume_size = 0

# ANF_HANA_data_volume_throughput, if defined, provides the throughput of the HANA data volume(s).
#ANF_HANA_data_volume_throughput = 0

# Use existing Azure NetApp volumes for HANA data.
#ANF_HANA_data_use_existing_volume = false

# ANF_HANA_data_volume_name, if defined, provides the name of the HANA data volume(s).
#ANF_HANA_data_volume_name = ""

# Number of ANF Data Volumes
ANF_HANA_data_volume_count = 1


#########################################################################################
#                                                                                       #
#  Azure NetApp Files - HANA Log                                                        #
#                                                                                       #
#########################################################################################

# ANF_HANA_log, if defined, will create Azure NetApp Files volume(s) for HANA log.
#ANF_HANA_log = false

# ANF_HANA_log_volume_size, if defined, provides the size of the HANA log volume(s).
#ANF_HANA_log_volume_size = 0

# ANF_HANA_log_volume_throughput, if defined, provides the throughput of the HANA log volume(s).
#ANF_HANA_log_volume_throughput = 0

# Use existing Azure NetApp volumes for HANA log.
#ANF_HANA_log_use_existing = false

# ANF_HANA_log_volume_name, if defined, provides the name of the HANA log volume(s).
#ANF_HANA_log_volume_name = ""

# Number of ANF Data Volumes
ANF_HANA_log_volume_count = 1

#########################################################################################
#                                                                                       #
#  Azure NetApp Files - HANA Shared                                                     #
#                                                                                       #
#########################################################################################

# ANF_HANA_shared, if defined, will create Azure NetApp Files volume(s) for HANA shared.
#ANF_HANA_shared = false

# ANF_HANA_shared_volume_size, if defined, provides the size of the HANA shared volume(s).
#ANF_HANA_shared_volume_size = 0

# ANF_HANA_shared_volume_throughput, if defined, provides the throughput of the HANA shared volume(s).
#ANF_HANA_shared_volume_throughput = 0

# Use existing Azure NetApp volumes for HANA shared.
#ANF_HANA_shared_use_existing = false

# ANF_HANA_shared_volume_name, if defined, provides the name of the HANA shared volume(s).
#ANF_HANA_shared_volume_name = ""


#########################################################################################
#                                                                                       #
#  Azure NetApp Files - /usr/sap                                                        #
#                                                                                       #
#########################################################################################

# ANF_usr_sap, if defined, will create Azure NetApp Files volume /usr/sap
#ANF_usr_sap = false

# ANF_usr_sap_volume_size, if defined, provides the size of the /usr/sap volume.
#ANF_usr_sap_volume_size = 0

# ANF_usr_sap_throughput, if defined, provides the throughput of the /usr/sap volume.
#ANF_usr_sap_throughput = 0

# Use existing Azure NetApp volumes for /usr/sap.
#ANF_usr_sap_use_existing = false

# ANF_usr_sap_volume_name, if defined, provides the name of the /usr/sap volume.
#ANF_usr_sap_volume_name = ""


#########################################################################################
#                                                                                       #
#  Azure NetApp Files - sapmnt                                                          #
#                                                                                       #
#########################################################################################

# ANF_sapmnt, if defined, will create Azure NetApp Files volume for /sapmnt
#ANF_sapmnt = false

# ANF_sapmnt_volume_size, if defined, provides the size of the /sapmnt volume.
#ANF_sapmnt_volume_size = 0

# ANF_sapmnt_volume_throughput, if defined, provides the throughput of the /sapmnt volume.
#ANF_sapmnt_volume_throughput = 0

# Use existing Azure NetApp volumes for /sapmnt.
#ANF_sapmnt_use_existing = false


# ANF_sapmnt_volume_name, if defined, provides the name of the /sapmnt volume.
#ANF_sapmnt_volume_name = ""

# ANF_sapmnt_use_clone_in_secondary_zone, if defined, uses clone in secondary region for sapmnt volume.
#ANF_sapmnt_use_clone_in_secondary_zone = false



#########################################################################################
#                                                                                       #
#  Credentials.                                                                         #
#  By default the credentials are defined in the workload zone                          #
#  Only use this section if the SID needs unique credentials                            #
#                                                                                       #
#########################################################################################

# The automation_username defines the user account used by the automation
#automation_username = ""

# The automation_password is an optional parameter that can be used to provide a password for the automation user
# If empty Terraform will create a password and persist it in keyvault
#automation_password = ""

# The automation_path_to_public_key is an optional parameter that can be used to provide a path to an existing ssh public key file
# If empty Terraform will create the ssh key and persist it in keyvault
#automation_path_to_public_key = ""

# The automation_path_to_private_key is an optional parameter that can be used to provide a path to an existing ssh private key file
# If empty Terraform will create the ssh key and persist it in keyvault
#automation_path_to_private_key = ""

# vm_disk_encryption_set_id if defined defines the custom encryption key
#vm_disk_encryption_set_id = ""

# nsg_asg_with_vnet if set controls where the Application Security Groups are created
nsg_asg_with_vnet = false

#########################################################################################
#                                                                                       #
# Resource Group                                                                        #
#                                                                                       #
#########################################################################################

# The resourcegroup_name value is optional, it can be used to override the name of the resource group that will be provisioned
#resourcegroup_name = ""

# The resourcegroup_name arm_id is optional, it can be used to provide an existing resource group for the deployment
#resourcegroup_arm_id = ""

# Prevent deletion of resource group if there are Resources left within the Resource Group during deletion
prevent_deletion_if_contains_resources = true


#########################################################################################
#                                                                                       #
#  Proximity Placement Group                                                            #
#                                                                                       #
#########################################################################################

# If provided, names of the proximity placement groups
#proximityplacementgroup_names = []

# If provided, azure resource ids for the proximity placement groups
#proximityplacementgroup_arm_ids = []

# Boolean value indicating if an proximity placement group should be used for the app tier VMs
use_app_proximityplacementgroups = false

# If provided, names of the application proximity placement groups
#app_proximityplacementgroup_names = []

# If provided, azure resource ids for the application proximity placement groups
#app_proximityplacementgroup_arm_ids = []

#########################################################################################
#                                                                                       #
#  Key Vault information                                                                #
#                                                                                       #
#########################################################################################

# If defined, specifies the Azure resource identifier for an existing key vault.
# Designed to host the SAP system credentials
#user_keyvault_id = ""

# If defined, specifies the Azure resource identifier for an existing key vault.
# Designed to host the deployment credentials used by the automation
#spn_keyvault_id = ""

# If defined, will enable purge control for the key vaults
enable_purge_control_for_keyvaults = false

#########################################################################################
#                                                                                       #
#  Networking                                                                           #
#  By default the networking is defined in the workload zone                            #
#  Only use this section if the SID needs unique subnets/NSGs                           #
#                                                                                       #
# The deployment automation supports two ways of providing subnet information.          #
# 1. Subnets are defined as part of the workload zone  deployment                       #
#    In this model multiple SAP System share the subnets                                #
# 2. Subnets are deployed as part of the SAP system                                     #
#    In this model each SAP system has its own sets of subnets                          #
#                                                                                       #
# The automation supports both creating the subnets (greenfield)                        #
# or using existing subnets (brownfield)                                                #
# For the greenfield scenario the subnet address prefix must be specified whereas       #
# for the brownfield scenario the Azure resource identifier for the subnet must         #
# be specified                                                                          #
#                                                                                       #
#########################################################################################

# The network logical name is mandatory - it is used in the naming convention and should map to the workload virtual network logical name
network_logical_name = "SAP01"

# use_loadbalancers_for_standalone_deployments is a boolean flag that can be used to control if standalone deployments (non HA) will have load balancers
use_loadbalancers_for_standalone_deployments = true

# use_private_endpoint is a boolean flag controlling if the key vaults and storage accounts have private endpoints
use_private_endpoint = true


#########################################################################################
#                                                                                       #
#  Admin Subnet variables                                                               #
#                                                                                       #
#########################################################################################

# If defined these parameters control the subnet name and the subnet prefix
# admin_subnet_name is an optional parameter and should only be used if the default naming is not acceptable
#admin_subnet_name = ""

# admin_subnet_address_prefix is a mandatory parameter if the subnets are not defined in the workload or if existing subnets are not used
#admin_subnet_address_prefix = ""

# admin_subnet_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing subnet to use
#admin_subnet_arm_id = ""

# admin_subnet_nsg_name is an optional parameter and should only be used if the default naming is not acceptable for the network security group name
#admin_subnet_nsg_name = ""

# admin_subnet_nsg_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing network security group to use
#admin_subnet_nsg_arm_id = ""

#########################################################################################
#                                                                                       #
#  DB Subnet variables                                                                  #
#                                                                                       #
#########################################################################################

# If defined these parameters control the subnet name and the subnet prefix
# db_subnet_name is an optional parameter and should only be used if the default naming is not acceptable
#db_subnet_name = ""

# db_subnet_address_prefix is a mandatory parameter if the subnets are not defined in the workload or if existing subnets are not used
#db_subnet_address_prefix = ""

# db_subnet_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing subnet to use
#db_subnet_arm_id = ""

# db_subnet_nsg_name is an optional parameter and should only be used if the default naming is not acceptable for the network security group name
#db_subnet_nsg_name = ""

# db_subnet_nsg_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing network security group to use
#db_subnet_nsg_arm_id = ""

#########################################################################################
#                                                                                       #
#  App Subnet variables                                                                 #
#                                                                                       #
#########################################################################################

# If defined these parameters control the subnet name and the subnet prefix
# app_subnet_name is an optional parameter and should only be used if the default naming is not acceptable
#app_subnet_name = ""

# app_subnet_address_prefix is an optional parameter that if provided specifies Azure resource identifier for the existing subnet to use
#app_subnet_address_prefix = ""

# app_subnet_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing subnet to use
#app_subnet_arm_id = ""

# app_subnet_nsg_name is an optional parameter and should only be used if the default naming is not acceptable for the network security group name
#app_subnet_nsg_name = ""

# app_subnet_nsg_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing network security group to use
#app_subnet_nsg_arm_id = ""

#########################################################################################
#                                                                                       #
#  Web Subnet variables                                                                 #
#                                                                                       #
#########################################################################################

# If defined these parameters control the subnet name and the subnet prefix
# web_subnet_name is an optional parameter and should only be used if the default naming is not acceptable
#web_subnet_name = ""

# web_subnet_address_prefix is an optional parameter that if provided specifies Azure resource identifier for the existing subnet to use
#web_subnet_address_prefix = ""

# web_subnet_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing subnet to use
#web_subnet_arm_id = ""

# web_subnet_nsg_name is an optional parameter and should only be used if the default naming is not acceptable for the network security group name
#web_subnet_nsg_name = ""

# web_subnet_nsg_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing network security group to use
#web_subnet_nsg_arm_id = ""

#########################################################################################
#                                                                                       #
# Anchor VM                                                                             #
#                                                                                       #
# The Anchor VM can be used as the first Virtual Machine deployed by the deployment,    #
# this Virtual Machine will anchor the proximity placement group and all the            #
# subsequent virtual machines will be deployed in the same group.                       #
# It is recommended to use the same SKU for the Anchor VM as for the database VM        #
#                                                                                       #
#########################################################################################

# the deploy_anchor_vm flag controls if an anchor VM should be deployed
#deploy_anchor_vm = false

# anchor_vm_sku if used is mandatory and defines the virtual machine SKU
#anchor_vm_sku = ""

# Defines the default authentication model for the Anchor VM (key/password)
#anchor_vm_authentication_type = ""

# Defines if the anchor VM should use accelerated networking
#anchor_vm_accelerated_networking = false

# The anchor_vm_image defines the Virtual machine image to use,
# if source_image_id is specified the deployment will use the custom image provided
# in this case os_type must also be specified
#anchor_vm_image = {}

# anchor_vm_nic_ips if defined will provide the IP addresses for the the Anchor VMs
#anchor_vm_nic_ips = []

# anchor_vm_use_DHCP is a boolean flag controlling if Azure subnet provided IP addresses should be used (true)
#anchor_vm_use_DHCP = false

# anchor_vm_authentication_username defines the username for the anchor VM
#anchor_vm_authentication_username = ""


#########################################################################################
#                                                                                       #
#  Terraform deployment parameters                                                      #
#                                                                                       #
#########################################################################################

# These are required parameters, if using the deployment scripts they will be auto populated otherwise they need to be entered

# tfstate_resource_id is the Azure resource identifier for the Storage account in the SAP Library
# that will contain the Terraform state files
#tfstate_resource_id = null

# deployer_tfstate_key is the state file name for the deployer
#deployer_tfstate_key = null

# landscape_tfstate_key is the state file name for the workload deployment
#landscape_tfstate_key = null

#########################################################################################
#                                                                                       #
#  SAP Application Information                                                          #
#                                                                                       #
#########################################################################################

# bom_name is the name of the SAP Application Bill of Materials file

#bom_name = ""

# configuration_settings is a dictionary containing values that will be persisted in sap-parameters.yaml
#configuration_settings = {}

############################################################################################
#                                                                                          #
#                                  Tags for all resources                                  #
#                                                                                          #
############################################################################################

# These tags will be applied to all resources
tags = {
  DeployedBy = "SDAF",
  Owner = "TBC"
}


#########################################################################################
#                                                                                       #
#  Scale out variables                                                                   #
#                                                                                       #
#########################################################################################

# If true, the database tier will be configured for scale out scenario
database_HANA_use_scaleout_scenario = false

# If true, the database scale out tier will not have a standby role
database_HANA_no_standby_role = false

# Defined the standby node count in a scale out scenario
stand_by_node_count = 0

# The Azure Resource identifier for the HANA shared volume storage account
#hanashared_id = []

# The Azure Resource identifier for the private endpoint connection to the HANA shared volume
#hanashared_private_endpoint_id = []


#########################################################################################
#                                                                                       #
#  AMS variables                                                                        #
#                                                                                       #
#########################################################################################

# If defined, will enable prometheus high availability cluster monitoring
enable_ha_monitoring = false

# If defined, will enable prometheus operating system level monitoring
enable_os_monitoring = false

# If defined, will use the specified Azure Monitor for SAP instance, else will use the AMS instance in the workload zone.
#ams_resource_id = ""


#########################################################################################
#                                                                                       #
#  DNS settings                                                                         #
#                                                                                       #
#########################################################################################

# dns_a_records_for_secondary_names defines if DNS records should be created for the virtual host names
dns_a_records_for_secondary_names = true

# register_endpoints_with_dns defines if the endpoints should be registered with the DNS
register_endpoints_with_dns = true



#########################################################################################
#                                                                                       #
#  Miscellaneous settings                                                               #
#                                                                                       #
#########################################################################################

# deploy_application_security_groups if defined will create application security groups
deploy_application_security_groups = true

# deploy_v1_monitoring_extension Defines if the Microsoft.AzureCAT.AzureEnhancedMonitoring extension will be deployed
deploy_v1_monitoring_extension = true

# resource_offset can be used to provide an offset for resource naming
# server#, disk#
#resource_offset = 0

# save_naming_information,defines that a json formatted file defining the resource names will be created
save_naming_information = false

# custom_prefix defines the prefix that will be added to the resource names
#custom_prefix = ""

# use_prefix defines if a prefix will be added to the resource names
use_prefix = true

# use_zonal_markers defines if a zonal markers will be added to the virtual machine resource names
use_zonal_markers = true

# shared_access_key_enabled defines Storage account authorization using Shared Access Key.
shared_access_key_enabled = false

# shared_access_key_enabled_nfs defines Storage account used for NFS shares authorization using Shared Access Key.
shared_access_key_enabled_nfs = true
