aws_region         = "ap-south-1"
app_keys           = "key1,key2,key3,key4"
api_token_salt     = "somerandomsalt"
admin_jwt_secret   = "somesecretjwt"
transfer_token_salt = "transfersecret"
encryption_key     = "encryptionsecret"

# If DB is needed (otherwise leave empty, Strapi will fail if DB not configured)
database_client    = "postgres"
database_host      = "your-rds-endpoint"
database_name      = "strapidb"
database_username  = "strapi"
database_password  = "strapi123"
