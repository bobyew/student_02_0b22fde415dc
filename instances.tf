resource "google_compute_instance" "tf-instance-1" {
  project      = "qwiklabs-gcp-01-7f9735c87187"
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  zone         = "us-east1-c"
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220719"
    }
  }
  network_interface {
    subnetwork = "subnet-01"
    access_config {
    }
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  project      = "qwiklabs-gcp-01-7f9735c87187"
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "us-east1-c"
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220719"
    }
  }
  network_interface {
    subnetwork = "subnet-02"
    access_config {
    }
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
