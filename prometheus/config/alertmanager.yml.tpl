global:
  resolve_timeout: 5m

route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 1m
  repeat_interval: 1h
  receiver: 'email'

receivers:
  - name: 'email'
    email_configs:
      - to: '${EMAIL_TO}'
        from: '${EMAIL_FROM}'
        smarthost: '${SMTP_HOST}:${SMTP_PORT}'
        auth_username: '${AUTH_USERNAME}'
        auth_identity: '${AUTH_IDENTITY}'
        auth_password: '${AUTH_PASSWORD}'
        send_resolved: true

