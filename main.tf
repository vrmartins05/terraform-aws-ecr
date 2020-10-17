locals {
  _name       = var.name
  image_names = length(var.image_names) > 0 ? var.image_names : [local._name]
}

resource "aws_ecr_repository" "name" {
    for_each             = toset(var.enabled ? local.image_names : [])
    name                 = each.value
    image_tag_mutability = var.image_tag_mutability
    image_scanning_configuration {
        scan_on_push = var.scan_on_push
    }
}

