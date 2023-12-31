output "instance_ids" {
  value = aws_rds_cluster_instance.instance[*].id
}

output "cluster_id" {
  value = aws_rds_cluster.cluster.id
}

output "cluster_endpoint" {
  value = aws_rds_cluster.cluster.endpoint
}