variable "widgets" {
  description = "The list of widgets in the dashboard."
  type        = any
}

variable "end" {
  description = "The end of the time range to use for each widget on the dashboard when the dashboard loads. If you specify a value for end, you must also specify a value for start. For each of these values, specify an absolute time in the ISO 8601 format. For example, 2018-12-17T06:00:00.000Z."
  default     = null
  type        = string
}

variable "start" {
  description = "The start of the time range to use for each widget on the dashboard."
  default     = null
  type        = string
}

variable "periodOverride" {
  description = "Use this field to specify the period for the graphs when the dashboard loads. Specifying auto causes the period of all graphs on the dashboard to automatically adapt to the time range of the dashboard. Specifying inherit ensures that the period set for each graph is always obeyed."
  default     = null
  type        = string
}
