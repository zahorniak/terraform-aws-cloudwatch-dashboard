# AWS CloudWatch Dashboard Terraform module

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/zahorniak/terraform-aws-cloudwatch-dashboard)

This Terraform module generates JSON template which you can use to create Terraform resource `aws_cloudwatch_dashboard`

## Usage

```hcl-terraform
module "dashboard" {
  source = "zahorniak/cloudwatch-dashboard/aws"
  start  = "-PT4H"
  widgets = [
    {
      x = 0
      y = 0

      type = "metric"
      properties = {
        metrics = [
          ["AWS/ECS", "MemoryUtilization", "ServiceName", "backend", "ClusterName", "staging_cluster"],
          [".", "CPUUtilization", ".", ".", ".", "."]
        ]
        view    = "timeSeries"
        stacked = false
        region  = "eu-central-1"
        title   = "Backend Service Load (2 min avg)"
        period  = 120
        stat    = "Average"
      }
    }
  ]
}

resource "aws_cloudwatch_dashboard" "dashboard" {
  dashboard_body = module.dashboard.json_map_encoded
  dashboard_name = "complete-example"
}

```

## Examples
* [complete-dasboard](https://github.com/zahorniak/terraform-aws-cloudwatch-dashboard/tree/master/examples/complete-dashboard)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| end | The end of the time range to use for each widget on the dashboard when the dashboard loads. If you specify a value for end, you must also specify a value for start. For each of these values, specify an absolute time in the ISO 8601 format. For example, 2018-12-17T06:00:00.000Z. | `string` | `null` | no |
| periodOverride | Use this field to specify the period for the graphs when the dashboard loads. Specifying auto causes the period of all graphs on the dashboard to automatically adapt to the time range of the dashboard. Specifying inherit ensures that the period set for each graph is always obeyed. | `string` | `null` | no |
| start | The start of the time range to use for each widget on the dashboard. | `string` | `null` | no |
| widgets | The list of widgets in the dashboard. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json\_map\_encoded | CloudWatch Dashboard JSON template |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
