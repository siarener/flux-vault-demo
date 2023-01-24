variable "region" { default = "eu-central-1" }
 
provider "aws" {
 region     = var.region
}
 
resource "aws_s3_bucket" "wego-tfc-test-s3" {
   bucket = "wego-tfc-test-s3"
   acl = "private"  
}