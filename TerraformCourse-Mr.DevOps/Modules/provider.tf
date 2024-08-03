provider "aws" {
  profile = "myaws"
  region = "us-east-1"
}

# one module can use multiple providers using alias concept
# check main.tf instance module for alias providers usage
# check below commented code for alias concept

/* provider "aws" {
  alias = "east-2"
  profile = "myaws"
  region = "us-east-2"
} */


