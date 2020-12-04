resource "elasticsearch_ingest_pipeline" "docker" {
  name = "docker"
  body = file("${path.module}/files/pipeline-docker.json")
}
