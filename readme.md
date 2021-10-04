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

As said, a simple provisioning has multiple dependencies on other cloud resources, which is ought to be done in specific order, for example subnet needs to be created after vpc.

## Terraform Components
Any terraform component comprises of the following,

### provider.tf
The provider.tf contains the configuration that are specific cloud providers. In our example, we are using the IBMCloud provider. The mandated varibales for provider configuration could be either set as environment variables or could be made as part of provider.tf.

### variables.tf
The input variables that any terrafrom module accepts is defined in the variables.tf.

In our use case at the root-level we accept input variable namespace.

```
```

### outputs.tf
The output that we want for further processing are defined at module level. The same could be used at the root level and written to the file or on console as required.

```
```

### tfstate
Last but not the least, terraform stores/maintains the last known state of the infrastructure to as state file. It could be stored remotely or locally. The number of backups for the tfstate file is configurable.

## Phases

### Plan
### Apply
### Destroy

