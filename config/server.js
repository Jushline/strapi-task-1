module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  app: {
    // APP_KEYS should be a comma-separated string -> env.array will split by comma
    keys: env.array('APP_KEYS', [
      'defaultKey1',
      'defaultKey2',
      'defaultKey3',
      'defaultKey4',
    ]),
  },
});
