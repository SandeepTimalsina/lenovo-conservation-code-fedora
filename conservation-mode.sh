
#!/usr/bin/env bash
set -euo pipefail

MODE_FILE="/sys/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/conservation_mode"

if [[ ! -e "$MODE_FILE" ]]; then
    echo "Error: Conservation mode control not found."
    echo "Your kernel or device path may have changed."
    exit 1
fi

show_status() {
    local value
    value=$(cat "$MODE_FILE")

    case "$value" in
        1) echo "Battery conservation mode: ENABLED" ;;
        0) echo "Battery conservation mode: DISABLED" ;;
        *) echo "Unknown conservation mode value: $value" ;;
    esac
}

set_mode() {
    local value="$1"

    if [[ ! "$value" =~ ^[01]$ ]]; then
        echo "Invalid value."
        exit 1
    fi

    if [[ $EUID -ne 0 ]]; then
        exec sudo bash "$0" "$value"
    fi

    printf '%s\n' "$value" > "$MODE_FILE"

    echo "Updated conservation mode."
    show_status
}

case "${1:-status}" in
    on|1)  set_mode 1 ;;
    off|0) set_mode 0 ;;
    status) show_status ;;
    *)
        echo "Usage: $0 {on|off|status}"
        exit 1
        ;;
esac
