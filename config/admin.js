module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'default_admin_jwt_secret'),
  },
  apiToken: {
    salt: env('API_TOKEN_SALT', 'default_api_token_salt'),
  },
  transfer: {
    token: {
      salt: env('TRANSFER_TOKEN_SALT', 'default_transfer_token_salt'),
    },
  },
  secrets: {
    encryptionKey: env('ENCRYPTION_KEY', 'default_encryption_key'),
  },
});
