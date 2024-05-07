set -eu

log_error() {
    echo "[ERROR] $1" >&2
}

if [ -z "${AQUA_VERSION:-}" ]; then
    log_error "AQUA_VERSION is required"
    exit 1
fi

has_command() {
    local cmd=$1
    command -v $cmd > /dev/null 2>&1
}

if ! has_command curl && ! has_command wget; then
    if has_command apt-get; then
        apt-get update -y
        apt-get install -y curl
    elif has_command apk > /dev/null 2>&1; then
        apk add curl
    else
        log_error "Neither curl nor wget is found. Please install either curl or wget to download aqua"
        exit 1
    fi
fi

"$(dirname $0)/aqua-installer"
