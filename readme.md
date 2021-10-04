# Terraforming on IBMCloud
The post tries to walks through the various steps at a novice level, refreshing the basic concepts involved at infrastructure provisioning using terraform. 

The automation of provisioning infrastructure has become mandatory in the cloud era. The infrastructure once successfully done must be promoted to various stages, scaled up and down, destroyed based on the need with lesser effort.

With cloud in place, the resources are charged in various permutations and combination indeed to a micro-second extent. Hence decommissioning or releasing of unused resource is not an option. At the same time, based on the traffic or any other need, the better infrastrucure must be rolled up instantly.

## What we're doing here,
In this tutorial we will be,
1. spinning up vsi instance within an VPC's subnet
2. Assign IP address to the instance
3. Assign an ssh key to the vsi innstance
4. Add an security inbound rule to VPC, so that port 22 is open
*The bulletins 3 to 4 is required so that we ssh to the vsi instance*

## Terraform Components
Any terraform automation comprises of the following,

### provider.tf
The provider.tf contains the configuration that are specific cloud providers. In our example, we are using the IBMCloud provider. The mandated varibales for provider configuration could be either set as environment variables or could be made as part of provider.tf.

```
terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.13.0"
    }
  }
}
```

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

## Let's see what we are going to do here.
