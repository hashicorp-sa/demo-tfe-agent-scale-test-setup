## Description

This repository contains code to setup a test for scaling out Terraform Cloud Agents with Terraform Enterprise. This can be used to test that your Terraform Enterprise instance specification is capable of supporting Terraform Cloud Agents at your desired scale.

It is a Terraform module that creates of the following resources:

1. `n1` agent pools and their associated agent tokens in Terraform Enterprise.
1. An AWS ECS cluster with `n1` services and `n2` containers in each service.
1. `n3` workspaces in Terraform Enterprise, each evenly distributed across the `n1` agent pools.

## Related Repositories

Scale Test Example Code: https://github.com/HashiCorp-CSA/demo-tfe-scale-test-demo-code

## Getting Started & Documentation

In order to run this repository, you must have Terraform Enterprise configured and a valid Terraform Enterprise API user or team token generated.

1. Create the variables required in Terraform Enterprise, Terraform Cloud or a local tfvars file:
    1. AWS credentials, e.g.:
        1. `AWS_SESSION_TOKEN`
        1. `AWS_SECRET_ACCESS_KEY`
    1. `TFE_TOKEN`: This is the Terraform Enterprise API user or team token.
    1. `tfe_hostname`: This is the Terraform Enterprise hostname.
1. Add any optional variables, the important ones being for scale:
    1. `pool_count`: This is the number of agent pools to create and also the number of services in ECS.
    1. `agent_per_pool_count`: This is the number of agents to create in each agent pool and also the number of containers per service in ECS.
    1. `workspace_count`: This is the number of workspaces to create in Terraform Enterprise.

Run the terraform using your preferred method (locally or in Terraform Enterprise or Cloud).

You will not have the base setup for the test and can move on to the [demo code repository](https://github.com/HashiCorp-CSA/demo-tfe-scale-test-demo-code) to run the test.
    
> IMPORTANT: Remember to run a `destroy` after the test has completed to clean up the resources created and avoid unnecessary costs.

## Contributing

To contribute to this repository, please fork it and raise a pull request.

## Disclaimer
“By using the software in this repository (the “Software”), you acknowledge that: (1) the Software is still in development, may change, and has not been released as a commercial product by HashiCorp and is not currently supported in any way by HashiCorp; (2) the Software is provided on an “as-is” basis, and may include bugs, errors, or other issues; (3) the Software is NOT INTENDED FOR PRODUCTION USE, use of the Software may result in unexpected results, loss of data, or other unexpected results, and HashiCorp disclaims any and all liability resulting from use of the Software; and (4) HashiCorp reserves all rights to make all decisions about the features, functionality and commercial release (or non-release) of the Software, at any time and without any obligation or liability whatsoever.”