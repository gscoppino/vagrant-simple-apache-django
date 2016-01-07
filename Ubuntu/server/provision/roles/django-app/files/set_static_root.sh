if [ "$@" -lt  1 ]; then
    exit 1
fi

cd $1

if ! grep -q "STATIC_ROOT" settings.py; then
    echo "STATIC_ROOT = os.path.join(BASE_DIR, 'static')" >> settings.py
else
    sed --in-place "/^STATIC_ROOT\s*=/s/^STATIC_ROOT\s*.*/STATIC_ROOT = os.path.join(BASE_DIR, 'static')/g" settings.py
fi

exit 0