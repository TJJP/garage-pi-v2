module.exports = {
  apps : [{
    name: 'garage-pi',
    script: 'server.js',
    cwd: '/home/garage/garage-pi',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '1G'
  }],
};
