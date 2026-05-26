variable "subnet_id" {
  type        = string
  description = "The VPC Public Subnet ID where instances will be launched"
}

variable "security_group_id" {
  type        = string
  description = "The Security Group ID to attach to the instances"
}

variable "key_name" {
  type        = string
  description = "The SSH Key Pair name for logging into the instances"
}