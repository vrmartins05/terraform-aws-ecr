# Terraform Module for AWS Elastic Container Registry


Terraform module to provision an [`AWS ECR Docker Container registry`](https://aws.amazon.com/ecr/).

---

This project is a study on Terraform to increase my skills in DevOps. 

## Usage Example

Include this repository as a module in your existing terraform code:

```hcl
provider "aws" {
    region = "us-east-1"
}

module "aws-ecr" {
    source = "../"

    name = "backend" 
   # image_names = ["frontend","api","repo"] # Descomentar para criar mais de um repositório no mesmo módulo.
    image_tag_mutability = "MUTABLE"
    scan_on_push = false   
}

```

To apply this example, run:

```console
$ terraform init
$ terraform plan
$ terraform apply
```

When convenient, remove created resources:

```console
$ terraform destroy
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | >= 2.34 |


## Providers

| Name | Version |
|------|---------|
| aws | >= 2.34 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Set to false to prevent the module from creating any resources | `bool` | `null` | no ||
| image\_names | List of repository names you want to create in AWS ECR | `list(string)` | `[]` | no |
| image\_tag\_mutability | The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE` | `string` | `"MUTABLE"` | no |
| name | Solution name, e.g. 'api' or 'frontend' | `string` | `null` | no |
| scan\_on\_push | Indicates whether images are scanned after being pushed to the repository (true) or not (false) | `bool` | `false` | no |


## Outputs

| Name | Description |
|------|-------------|
| registry\_id | Registry ID |
| repository\_arn | ARN of first repository created |
| repository\_arn\_map | Map of repository names to repository ARNs |
| repository\_name | Name of first repository created |
| repository\_url | URL of first repository created |
| repository\_url\_map | Map of repository names to repository URLs |


## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```