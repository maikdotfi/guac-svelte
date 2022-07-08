provider "google" {
  credentials = file("guacamole.json")

  project     = "guacamole-stuff"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      # debian11 from global images is missing cloud-init, go with Ubuntu
      image = "ubuntu-os-pro-cloud/ubuntu-pro-2004-lts"
    }
  }

  // Local SSD disk
  #scratch_disk {
  #  interface = "SCSI"
  #}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
      network_tier = "STANDARD"
    }
  }

  metadata = {
    foo = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = file("./cloud-init.conf")
  }

  # this would run every boot?
  #metadata_startup_script = "echo hi > /test.txt"

}

output "nic" {
  value = google_compute_instance.default.network_interface
}
