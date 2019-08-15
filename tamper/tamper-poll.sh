#!/bin/bash

RTC_DEVICE="rtc0"
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

poll_tamper_timestamp()
{
  if [ -f "${SYSFS}" ]; then
    ts=$(cat "${SYSFS}")
    if [ -n "$ts" ]; then
      ts_str=$(date -d "@$ts")
      echo "Tamper! $ts_str ($ts)"
      tamper_reset_timestamp
      i=$((i + 1))
    fi
  else
    error_msg "sysfs interface missing!"
  fi
}

echo "Starting tamper detection (dev: ${RTC_DEVICE})!"
i="0"
while [ $i -lt ${MAX_COUNT} ]; do
  poll_tamper_timestamp
  # Cooldown between polls
  sleep 3
done

