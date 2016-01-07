if [ "$@" -lt  1 ]; then
    exit 1
fi

cd $1

if ! grep -q "STATIC_URL" settings.py; then
    echo "STATIC_URL = '/static/backend/'" >> settings.py
else
    sed --in-place "/^STATIC_URL\s*=/s/^STATIC_URL\s*.*/STATIC_URL = '\/static\/backend\/'/g" settings.py
fi

exit 0