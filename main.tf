locals {
  dashboard = {
    start          = var.start
    end            = var.end
    periodOverride = var.periodOverride
    widgets        = var.widgets
  }
  json_map = jsonencode(local.dashboard)
}
