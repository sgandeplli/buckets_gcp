provider "google" {
	credentials = file("gcp.json")
	project = "primal-gear-436812-t0"
	region = "us-central1"
}

resource "google_storage_bucket" "bucket" {
	name = "my-unique-bucket-name-sekhargandepalli"
	location = "US"
	storage_class = "STANDARD"


}

resource "google_compute_instance" "vm_instance" {
	name = "cloud-bucket"
	machine_type = "e2-micro"
	zone = "us-central1-a"

	boot_disk {
		initialize_params{
			image = "centos-cloud/centos-stream-9"
		}
	}
	network_interface{
		network = "default"
		access_config {}
	}
	tags = ["http-server"]
	depends_on = [google_storage_bucket.bucket]
}
