# Lenovo Yoga C740 Conservation Mode for Fedora Linux

A Bash script to enable or disable battery conservation mode on the Lenovo Yoga C740 running Fedora Linux, helping manage battery charging when using AC power or battery power.

## Features

- Enable battery conservation mode.
- Disable battery conservation mode.
- Support for controlling Lenovo battery charging settings through Linux sysfs.
- Lightweight Bash script with no graphical interface required.

## Requirements

- Lenovo Yoga C740 (or a compatible Lenovo laptop).
- Fedora Linux.
- Bash shell.
- Access to the Lenovo battery conservation-mode sysfs interface.
- Appropriate permissions to change the battery charging setting.

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/lenovo-conservation-code-fedora.git
cd lenovo-conservation-code-fedora
```

Replace `YOUR_USERNAME` with your GitHub username.

Alternatively, download `conservation-mode.sh` directly into your project directory.

## Usage

Make the script executable if necessary:

```bash
chmod +x conservation-mode.sh
```

Run the script:

```bash
./conservation-mode.sh
```

Follow the instructions provided by the script to enable or disable conservation mode.

Depending on how the script accesses your system's battery interface, it may require administrator privileges. Use `sudo` only if the script's implementation requires it.

## What Is Conservation Mode?

Lenovo battery conservation mode limits the maximum battery charge level to help reduce battery wear when the laptop is frequently connected to AC power.

The exact charging thresholds and interface availability depend on the laptop model and firmware.

## Compatibility

This project is primarily intended for the Lenovo Yoga C740 running Fedora Linux. Compatibility with other Lenovo models and Linux distributions has not been verified.

## Troubleshooting

- **Conservation mode is unavailable:** Check whether your laptop exposes a supported conservation-mode interface under `/sys/bus/platform/drivers/ideapad_acpi/` or another Lenovo platform-driver path.
- **Permission denied:** Check the permissions required by the script and whether elevated privileges are necessary.
- **Setting does not change:** Verify that your laptop's firmware and Linux kernel support the feature.

## Disclaimer

Use this script at your own risk. Hardware support and battery-management behavior may vary by model, firmware, and kernel version. Review the script before running it with elevated privileges.

## License

Choose a license before distributing this project publicly. For example, you may use the MIT License by adding a `LICENSE` file.
