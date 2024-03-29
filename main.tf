terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.0.0" # specify your required version
    }
  }
}

provider "digitalocean" {
  token = local.do_token
}

resource "digitalocean_kubernetes_cluster" "my_k8s_cluster" {
  name    = "fiap-food-k8"
  region  = "nyc1"
  version = "1.29.1-do.0"

  node_pool {
    name       = "fiap-food-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}

