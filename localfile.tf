resource "local_file" "myfile" {

  filename = "test-file.txt"
  content = "THis file is created through Terraform"

}
