---
layout: default
title: 3.01 Participation - Device Setup
parent: SOPs
grand_parent: SAFER Wearables
has_children: false
---

# Device Setup
{: .no_toc }

This page provides details of how devices are setup ready to be sent to participants of the SAFER Wearables Study.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Cleaning

All devices should be cleaned using wipes.

## Bittium Faros 180

1. Connect the device to a Windows PC via USB.
2. Open [Bittium Faros Manager](https://www.bittium.com/medical/support)
3. Keep the device attached until it is fully charged (this could take 1-2 hours), as indicated by 100&#37; 'Battery Charge' in the Bittium Faros Manager software.
4. In Bittium Faros Manager, make sure that the device is setup correctly:
   - Check that the device name is 'SN_#######', where ####### is the device serial number.
   - Check that the date and time are coorect and that the device time is set to synchronize with PC time.
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


## PulseOn OHR Tracker

1. Sync the device with a mobile phone using the 'PulseOn Demo' application
2. Charge the device via USB until it is fully charged (as indicated by the battery indicator reaching the top of the outer rectangle in the battery logo).
3. Unplug, put back in the wristband.
4. Sync the device once more, and set the device mode (currently using 'Sampled mode') in the 'PulseOn Demo' application
5. Turn the device off, and it is ready to send.

## PulseOn Arrythmia Monitor

1. Charge the device via USB until it is fully charged (as indicated by the battery indicator being green).
2. Follow the instructions in the README.md file provided by PulseOn, using:
   - https://prod.pulseon-ecg.uk/
   - device serial number "SN#####" as the first name and identifier, and "SETUPYYYYMMDD" as the last name.
   - The following settings for the measurement session: time zone - "00:00 Europe/London"; (i) session type - "Screening (without gateway)"; (ii) session length - "1 weeks"; (iii) quiet time - "22:00-08:00"; (iv) timed measurements - "09:00", "12:00", "16:00", "20:00"; 

## Withings Move-ECG

1. Open HealthMate on a mobile phone.
2. ...

## Mobile Phone

### Initial setup
{: .no_toc }
- **Initial turning on**:
   - select 'English (UK) language;
   - connect to WiFi;
   - allow to check for updates;  
   - don't copy apps and data;  
   - don't sign in to Google;  
   - in Google Services settings turn off 'use location', 'allow scanning', 'send usage and diagnostic data' options, and agree to terms of service;  
   - select Google as search engine;  
   - skip setting screen lock;  
   - under 'Review additional apps' press ok;  
   - under 'About your privacy', select 'Privacy settings', and turn off 'Help improve Motorola products' and 'Enhanced device support', and press 'Accept and continue';  
   - don't enter email address;  
   - don't grant location permission.

- **Settings**:
   - **Sound**: turn all four volumes down to minimum; under advanced settings turn off all options except 'Charging sounds and vibration', and 'Touch vibration'.
   - **Display**: Set 'Brightness level' to about 75%; under advanced settings set 'Screen timeout' to 5 minutes, 'Font size' to largest, 'Display size' to largest, 'Screen saver' to never start

- **Home screen**: Remove all apps on screen, including those on the bottom bar;

- **Installing apps**:
   - **Play Store**: Login using Google Account, turning off 'Back up to Google Drive' when the option appears. Install 'Withings Health Mate', and 'MacroDroid'.
   - **Withings Health Mate**: Login; install Move ECG device (including allowing access to location, and setting daily step goal to 15,000, and selecting the 'Right' wrist); turn off persistent notifications under settings.
   - **PulseOn Demo**: Install the PulseOn Demo app using the 'Application-pulseonDemo-1.2.0-debug.apk' file (allowing required permissions). _NB: the macro settings may need updating when using large font._
   - **MacroDroid**: Share the following macros from an already setup phone via Bluetooth: (i) Cancel macros; (ii) Close all apps; (iii) Launch healthmate; (iv) Launch pulseon software. Then use the 'Export/Import' function in MacroDroid to import each one in turn from the 'Bluetooth' folder, giving the necessary permissions. Finally, add the red, green and yellow MacroDroid widget buttons on the home screen.

- **Finishing setup**:
   - Sign out of Google account
   - Deny location access to all apps except for 'Health Mate' and 'PulseOn Demo', and for these, set to 'Allowed only while in use'.
   - Add HealthMate and PulseOn apps to bar at bottom of screen.
   - Add MacroDroid app at top of screen
   - Add label to back of phone indicating power button
   - Add protective cover
