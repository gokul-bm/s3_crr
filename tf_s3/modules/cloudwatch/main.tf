resource "aws_cloudwatch_metric_alarm" "replication_lag" {
  alarm_name          = "s3-replication-lag"
  namespace           = "AWS/S3"
  metric_name         = "ReplicationLatency"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 1
  threshold           = 900
  comparison_operator = "GreaterThanThreshold"
  alarm_actions       = [var.sns_topic_arn]
}