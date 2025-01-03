variable "digitalocean_token" {
  description = "DigitalOcean API token"
  type        = string
}

provider "digitalocean" {
  token = var.digitalocean_token 
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "jeanDroplet1" {
  name   = "terraform-droplet-1"
  image  = "ubuntu-24-10-x64"   
  region = "sgp1"              
  size   = "s-1vcpu-1gb"       

  user_data = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
  EOT
}

resource "digitalocean_droplet" "jeanDroplet2" {
  name   = "terraform-droplet-2"
  image  = "ubuntu-20-04-x64"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}

resource "digitalocean_volume" "jeanVolume1" {
  name                    = "terraform-volume-1"
  region                  = digitalocean_droplet.jeanDroplet2.region
  size                    = 10
  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume_attachment" "jeanVolumeAttachment1" {
  droplet_id = digitalocean_droplet.jeanDroplet2.id
  volume_id  = digitalocean_volume.jeanVolume1.id
}

resource "digitalocean_firewall" "jeanFirewall" {
  name = "terraform-firewall"

  droplet_ids = [
    digitalocean_droplet.jeanDroplet1.id,
    digitalocean_droplet.jeanDroplet2.id
  ]

  inbound_rule {
    protocol    = "tcp"
    port_range  = "22"
    source_addresses = ["0.0.0.0/0"]  
  }

  inbound_rule {
    protocol    = "tcp"
    port_range  = "80"
    source_addresses = ["0.0.0.0/0"] 
  }

  outbound_rule {
    protocol = "tcp"
    port_range = "all"
    destination_addresses = ["0.0.0.0/0"] 
  }
}