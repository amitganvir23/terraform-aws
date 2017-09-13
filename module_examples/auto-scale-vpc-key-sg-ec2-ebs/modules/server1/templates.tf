data "template_file" "userdata-vm" {
   template = "${file("${path.module}/templates/userdata-vm1")}"

   vars {
     mount_data_dir     = "${var.mount_data_dir}"
     disk_name     	= "${var.disk_name}"
   }
}

