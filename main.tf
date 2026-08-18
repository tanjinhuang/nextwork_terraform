provider "aws" { # tell Terraform to use AWS
  region = "ap-southeast-1" # region
  default_tags { # default tags for all resources
    tags = {
      Environment = "Dev"
      Project     = "NextWork"
      DeployMethod = "Terraform"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" { # create an S3 bucket, "my_bucket" is the name of the resource (like a variable for future referencing)
  bucket = "nextwork-unique-bucket-tanjinhuang-terraform" # Make sure this bucket name is globally unique by typing a long random number

  tags = {
    Name        = "My bucket"
    # note: the default tags will be automatically added to this resource, so the final tags will be:
    # Environment = "Dev"
    # Project     = "NextWork"
    # DeployMethod = "Terraform"
  }

}

resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" { # control public access to the S3 bucket
  bucket = aws_s3_bucket.my_bucket.id 

  # bucket configurations
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
