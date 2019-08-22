# Linux EMC test scripts

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![GitHub license](https://img.shields.io/github/license/baxeno/linux-emc-test)](https://github.com/baxeno/artifactory-network-backup/blob/master/LICENSE)

This repository contain useful scripts for [Electromagnetic compatibility (EMC)](https://en.wikipedia.org/wiki/Electromagnetic_compatibility) testing of embedded Linux based products as part of CE marking in Europe.
Test focus lies on communication busses and signals between [System-on-Chip (SoC)](https://en.wikipedia.org/wiki/System_on_a_chip) and other chips as this are typical places for RF emission and immunity issues.

Chips: Ethernet PHY, RTC, EEPROM, DDRx, eMMC, Temperature sensor, GPS, etc.
Communication busses and signals like I2C, SPI, UART, USB, RMII, GPIO input/output/interrupts, etc.

Test cases can also be used as robustness device driver test when developing new device support in Linux.

**:no_entry_sign: Out of scope for this project**

- Test of Linux kernel API and system libraries.
  - Look at [Linux test project](https://github.com/linux-test-project/ltp) for this type of tests.

---
:star: Test cases :star:
---

Each test case has a seperat readme with requirements and settings.

- [Tamper detection IRQ/poll](tamper/README.md)
- [Real-Time Clock (RTC)](rtc/README.md)
- [USB Mass-Storage Device (MSD)](usb/README.md)

## :construction: Development

What to help? See [CONTRIBUTING.md](CONTRIBUTING.md).
