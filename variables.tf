variable "production_account" {
  type        = bool
  default     = false
  description = "Production account"
}

variable "retention_period_days" {
  type        = number
  default     = 9
  description = "How many days to retain logs for"
}

variable "shard_count" {
  type        = number
  default     = 2
  description = "Number of shards to split an index into. Should be based on the number of nodes in the cluster"
}
