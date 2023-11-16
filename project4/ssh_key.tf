resource "aws_key_pair" "devops" {
    key_name = "devops"
    public_key  = file("devops.pem.pub")
  
}