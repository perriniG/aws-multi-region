resource "aws_key_pair" "devops2" {
  key_name   = "class_key2"
  public_key = file("devops.pub")

}