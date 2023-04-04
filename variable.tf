/* /* variable "network_interface_id" {
  type = string
  default = "network_id_from_aws"
} */

/* variable "ami" {
    type = string
    default = "ami-0735c191cf914754d"

}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_name"{
    description = "name of the instance"
    type = string
    default = "magento"
}

variable "subnet_id" {
    description = "subnet id"
    default = "subnet-0e89bc0f084bbeaef"
}

variable "security_groups"{
    description = "security groups details"
default = "sg-0bce0eb7468d4c97f"
} 
 */

variable "awsprops" {
  type = map(any)
  default = {
    vpc               = "vpc-0921ca8fa447d442b"
    ami               = "ami-0fcf52bcf5db7b003"
    subnet            = "subnet-0e89bc0f084bbeaef"
    publicip          = true
    keyname           = "tf-key-pair"
    securitygroupname = "sgmg"
    instance_type     = "t2.micro"
    instance_id       = "i-0ec43c1acc38ea867"
    volume_id         = "vol-0f79ad3890b416c91"
    availability_zone = "us-west-2b"
  }
}