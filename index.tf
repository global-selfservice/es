resource "elasticsearch_index_lifecycle_policy" "logstash-ilm" {
  name = "logstash-ilm"
  body = templatefile("${path.module}/files/ilm-policy-logstash.json.tmpl", { retention_period_days = var.retention_period_days })
}

output "ilm" {
  value = elasticsearch_index_lifecycle_policy.logstash-ilm.body
}

resource "elasticsearch_index_template" "logstash" {
  name = "logstash"
  body = templatefile("${path.module}/files/index-template-logstash.json.tmpl", { shard_count = var.shard_count })
}

output "index-template" {
  value = elasticsearch_index_template.logstash.body
}

resource "elasticsearch_kibana_object" "logstash" {
  body = templatefile("${path.module}/files/index-pattern-logstash.json.tmpl", { fields = file("${path.module}/files/index-pattern-logstash-fields.json.tmpl") })
}

output "index-pattern" {
  value = elasticsearch_kibana_object.logstash.body
}

