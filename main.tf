terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket  = "tf-bucket-356452"
    prefix  = "terraform/state"
  }    
}


provider "google" {
  #version = "~> 3.45"
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "instances" {
  source                        = "./modules/instances/"
}

module "storage" {
  source                        = "./modules/storage/"
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 3.4.0"

    project_id   = var.project_id
    network_name = "tf-vpc-317494"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = var.region
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = var.region
        }
    ]
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-7f9735c87187/global/networks/tf-vpc-317494"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}