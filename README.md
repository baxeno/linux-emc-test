# Linux EMC test scripts

This repository contain useful scripts for [Electromagnetic compatibility (EMC)](https://en.wikipedia.org/wiki/Electromagnetic_compatibility) testing of embedded Linux based products as part of CE marking in Europe.
Test focus lies on communication busses and signals between [System-on-Chip (SoC)](https://en.wikipedia.org/wiki/System_on_a_chip) and other chips as this are typical places for RF emission and immunity issues.

Chips: Ethernet PHY, RTC, EEPROM, DDRx, eMMC, Temperature sensor, GPS, etc.
Communication busses and signals like I2C, SPI, UART, RMII, GPIO input/output/interrupts, etc.

**:no_entry_sign: Out of scope for this project**

- Test of Linux kernel API and system libraries.
  - Look at [Linux test project](https://github.com/linux-test-project/ltp) for this type of tests.


---
Test cases
---

Each test case has a seperat readme with requirements and settings.

- [Tamper detection](tamper/README.md)
