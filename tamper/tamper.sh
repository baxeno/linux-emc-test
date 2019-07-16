#!/bin/bash

RTC_DEVICE="rtc0"
DT_GPIO_LABEL="rtc-tamper-irq"
MAX_COUNT=20

SYSFS="/sys/class/rtc/${RTC_DEVICE}/timestamp0"

error_msg()
{
  echo "Error! $1"
  exit 1
}

tamper_reset_timestamp()
{
  if [ -f "${SYSFS}" ]; then
    echo "" > "${SYSFS}"
  else
    error_msg "sysfs interface missing!"
  fi
}

tamper_read_timestamp()
{
  if [ -f "${SYSFS}" ]; then
    ts=$(cat "${SYSFS}")
    if [ -n "$ts" ]; then
      ts_str=$(date -d "@$ts")
      echo "Tamper! $ts_str ($ts)"
    fi
  else
    error_msg "sysfs interface missing!"
  fi
}

IFS=" " read -r -a gpio <<< "$(gpiofind $DT_GPIO_LABEL)"
if [ -z "${gpio[*]}" ]; then
  error_msg "GPIO label missing in device tree!"
fi

echo "Starting tamper detection (dev: ${RTC_DEVICE}, irq: ${DT_GPIO_LABEL})!"
i="0"
while [ $i -lt ${MAX_COUNT} ]; do
  tamper_reset_timestamp
  # Show timestamp when receiving interrupt (active low)
  gpiomon -f -n 1 "${gpio[@]}" && tamper_read_timestamp
  # Cooldown between interrupts
  sleep 1
  i=$((i + 1))
done


#Starting tamper detection!
#event: FALLING EDGE offset: 12 timestamp: [1563290457.445881880]
#Tamper! Tue Jul 16 15:20:58 UTC 2019 (1563290458)
#event: FALLING EDGE offset: 12 timestamp: [1563290672.799891842]
#Tamper! Tue Jul 16 15:24:34 UTC 2019 (1563290674)
