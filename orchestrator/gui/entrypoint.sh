#!/bin/sh

cat > /orchestrator-core-gui/.env.local <<EOF
BACKEND_URL="http://$CORE_HOSTNAME:$CORE_PORT"
# You can use the builtin webppack proxy during development which will connect you to BACKEND_URL
REACT_APP_BACKEND_URL="http://localhost:$APP_PORT"

REACT_APP_CHECK_STATUS_INTERVAL="0"
REACT_APP_TRACING_ENABLED="false"
REACT_APP_SENTRY_DSN="https://user@sentry.com/9"
REACT_APP_TRACE_SAMPLE_RATE="1"
REACT_APP_RELEASE="local"
REACT_APP_ENVIRONMENT="local"
REACT_APP_TRACING_ORIGINS="*"

# Fill in when Enabling OAUTH2
REACT_APP_OAUTH2_ENABLED=False
REACT_APP_OAUTH2_CLIENT_ID=
REACT_APP_OAUTH2_OPENID_CONNECT_URL=
REACT_APP_OAUTH2_SCOPE=
EOF

. /orchestrator-core-gui/.env.local
cd /orchestrator-core-gui
yarn start

#tail -f /dev/null