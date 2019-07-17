# Tamper function test

This test is primarily a radiated immunity test.

:one: Make sure high impedance circuits like tamper switch isn't affected (triggered without mechanical movement).
:two: Make sure interrupt signal between SoC and tamper chip isn't affected (triggered without tamper).

**Requirements:**

- libgpiod: library accompanied by a set of tools for interacting with the Linux GPIO character device.
- kernel-headers >= 4.8.
- Device tree: IRQ signal using gpio pin label (not gpio-hog).
  ** Default: `rtc-tamper-irq`
- RTC with tamper support: ex. `rtc-pcf2117`
  ** Default: `rtc0`

**Usage:**
Start test in backgroud so it's easy to have multiple tests running during EMC testing.

`./tamper.sh &`

> RTC device and IRQ label name can be changed with defines in the script.

**Example output:**

```bash
Starting tamper detection!
event: FALLING EDGE offset: 12 timestamp: [1563290457.445881880]
Tamper! Tue Jul 16 15:20:58 UTC 2019 (1563290458)
event: FALLING EDGE offset: 12 timestamp: [1563290672.799891842]
Tamper! Tue Jul 16 15:24:34 UTC 2019 (1563290674)
```
