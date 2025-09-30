aws_region = "ap-south-1"

# Strapi secrets: replace these with secure values
app_keys            = "k1,k2,k3,k4"
api_token_salt      = "random_api_salt"
admin_jwt_secret    = "random_admin_jwt"
transfer_token_salt = "random_transfer"
encryption_key      = "random_encryption_key"

# DB credentials for RDS (will be used by TF to create RDS)
database_name     = "strapidb"
database_username = "strapi"
database_password = "StrapiStrongPassword123!"  # keep this secret, don't commit
database_host     = "" # leave blank: TF will fill with RDS endpoint
