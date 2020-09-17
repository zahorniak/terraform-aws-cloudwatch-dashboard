provider "aws" {
  region = "eu-central-1"
}

module "dashboard" {
  source = "../../"
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
    },
    {
      x = 6
      y = 0

      type = "metric"
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "RequestCountPerTarget", "TargetGroup", "target_group_name"]
        ]
        view     = "timeSeries"
        stacked  = false
        region   = "eu-central-1"
        title    = "RequestsPerTarget (1 min sum)"
        period   = 60
        stat     = "Sum"
        liveData = false
      }
    }
  ]
}

resource "aws_cloudwatch_dashboard" "dashboard" {
  dashboard_body = module.dashboard.json_map_encoded
  dashboard_name = "complete-example"
}
