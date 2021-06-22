---
layout: default
title: Device Setup
parent: SAFER Wearables
has_children: false
---

# Device Setup
{: .no_toc }

This page provides details of how devices are being setup for use in the SAFER Wearables Study.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Bittium Faros 180

### Pre-study
{: .no_toc }

1. Connect the device to a Windows PC via USB.
2. Open [Bittium Faros Manager](https://www.bittium.com/medical/support)
3. Keep the device attached until it is fully charged (this could take 1-2 hours), as indicated by 100&#37; 'Battery Charge' in the Bittium Faros Manager software.
4. In Bittium Faros Manager, make sure that the device is setup correctly:
   - _ECG/EKG_ set to 'On'
   - _Accelerometer_ set to 'Off'
   - _RR-interval_ set to 'Off'
   - _Number of ECG channels_ set to '1' (there isn't another option)
   - _ECG Sampling Frequency_ set to '125 Hz'
   - _Autostart on Skin Contact_ set to 'On' [TBC].
   - Press _SAVE_ to store these settings.
5. In addition, make the following manual adjustments to the `.\SYS\FAROS.CFG` file (which is a text file):
   - _bat_alarm_beep_ set to '0'
   - Save the file after making these adjustments
6. Check that the device doesn't have any data stored on it (by using Windows File Explorer to inspect the `.\DATA` folder on the device. Delete any files in this folder (apart from `BUFFER`). This should leave approximately 89&#37; 'Free Memory', as stated in Bittium Faros Manager.
7. Use Bittium Faros Manager to eject the device.
8. Unplug.
9. Check that the device is turned off (there are no lights showing, even intermittently, on the device).
10. Insert the electrode set into the USB port of the device.

### Post-study
{: .no_toc }


## PulseOn OHR Tracker

### Pre-study
{: .no_toc }

1. Charge the device via USB until it is fully charged (as indicated by the battery indicator reaching the top of the outer rectangle in the battery logo).
2. Sync the device with a mobile phone using the 'PulseOn Demo' application
3. Unplug, put back in the wristband.
4. Turn the device off, and it is ready to send.

### Post-study
{: .no_toc }


## Withings Move-ECG

### Pre-study
{: .no_toc }

1. Open HealthMate on a mobile phone.
2. Sync the device with a mobile phone using the 'PulseOn Demo' application
3. Unplug, put back in the wristband, and it is ready.

### Post-study
{: .no_toc }



## Mobile Phone

### Pre-study
{: .no_toc }

1. Turn on.
2. Charge via USB until fully charged.
3. Remove all PulseOn files from the phone (by deleting the `PulseOnOHR` folder from within `Internal Storage`).
- _Need an instruction here on how to check there is no HealthMate data on the phone_
4. Open MacroDroid, and make sure the slider is set to on (_i.e._ the right hand side).
5. Make sure Bluetooth is turned on, and WiFi is turned off.
3. Close all apps.
4. Turn off.

### Post-study
{: .no_toc }
