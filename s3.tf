resource "aws_s3_bucket" "drift_a" {
  bucket = "accurics-drift-test-a"
  acl    = "private"

  versioning {
    enabled = true
  }
  

}


resource "aws_s3_bucket" "drift_b" {
  bucket = "accurics-drift-test-b"
  acl    = "private"

  versioning {
    enabled = true
  }

 
}

resource "aws_s3_bucket" "drift_c_new" {
  bucket = "accurics-drift-test-c-new"
  acl    = "private"

  versioning {
    enabled = true
  }
  

}
