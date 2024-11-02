output "alb_hostname" {
  value = "${aws_alb.main.dns_name}:3000"
}
output "aws_alb_target_group" {
  value = aws_alb_target_group.app.id
}
output "frotend_listener" {
  value = aws_alb_listener.front_end.id
}