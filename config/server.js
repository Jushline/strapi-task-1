// config/admin.js
module.exports = ({ env }) => ({
  auth: {
    // Admin JWT secret for admin login / sessions
    secret: env('ADMIN_JWT_SECRET', 'default_admin_jwt_secret'),
  },
  apiToken: {
    // API token salt required by Strapi v4
    salt: env('API_TOKEN_SALT', 'default_api_token_salt'),
  },
});
