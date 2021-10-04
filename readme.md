# Terraforming on IBMCloud
The post tries to walks through the various steps at a novice level, refreshing the basic concepts involved at infrastructure provisioning using terraform. 

The automation of provisioning infrastructure has become mandatory in the cloud era. The infrastructure once successfully done must be promoted to various stages, scaled up and down, destroyed based on the need with lesser effort. 

With cloud in place, the resources are charged in various permutations and combination indeed to a micro-second extent. Hence decommissioning or releasing of unused resource is not an option. At the same time, based on the traffic or any other need, the better infrastrucure must be rolled up instantly.

## What we're doing here,
In this tutorial we will be, spinning up an virtual server instance(vsi) and ssh into the vsi which has following pre-requisites,
1. VPC
2. Subnet
3. VPC inbound rule to allow/open port 22 for ssh
4. IP address
5. SSH Key that ought to be mapped to virtual server.

### Pre-requisites
We use the resource group for provisioning of infrastructure already exists. Per this project, namespace means resource group name. Terraform's data is used for retrieving the resource group id.

### Pictorial Representation


As said, a simple provisioning has multiple dependencies on other cloud resources, which is ought to be done in specific order, for example subnet needs to be created after vpc.

## Terraform Components
Any terraform component comprises of the following,

### provider.tf
The provider.tf contains the configuration that are specific cloud providers. In our example, we are using the IBMCloud provider. The mandated varibales for provider configuration could be either set as environment variables or could be made as part of provider.tf.

### variables.tf
The input variables can be defined both at modules and at the project's root level.

### outputs.tf
Similarly the output variables can be defined at both module and root level. It could be either written to the file or on console as required.

### tfstate
Last but not the least, terraform stores/maintains the last known state of the infrastructure to as state file. It could be stored remotely or locally. The number of backups for the tfstate file is configurable.

## Phases

### Init
The init pulls all the required provider resources based on configuration.

### Plan
The CORE responsibilty of the plan is evalauting the differences between the last know config state and the current configuration  that is sent as input.

In our use case, we are having the tfvars within a demo. So as demonstrate the ease of deploying n-number infrastructures and tearing down unused infrastructures as and when required.

```
terraform plan -var-file=demo/terraform.tfvars -out=demo/demo.tfstate
```

The above command creates a plan based on the input file demo/terrafom.tfstate and stores it in  the file demo/demo.tfstate, so the generated and verified plan can be used as an input while applying.

### Apply 
This provisions the infrastructure per the configuration. Below command runs in a auto-approve, which does not prompts approval.

```
terraform apply -var-file=demo/terraform.tfvars -state=demo/current.tfstate -auto-approve
```

### Destroy
Decommisssions the infrastructure based on the tfstate and variables file. Below command tears down the infrastructure and does not prompt's for approval.

```
terraform destroy -var-file=demo/terraform.tfvars -state=demo/current.tfstate -auto-approve
```