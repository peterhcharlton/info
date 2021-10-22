---
layout: default
title: Device Pack Preparation
parent: SOPs
has_children: false
grand_parent: SAFER Wearables
---

# Mail Package Preparation
{: .no_toc }

This page describes how to put together a Device Pack to be sent to a participant.
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

1. Disconnect the device.
2. Remove lead set.
3. Clean device and lead set.
4. Plug device into Windows PC using USB device.
5. Copy across the relevant data file(s)
6. Leave device on charge until fully charged (usually 1-2 hours)
7. Remove device and make sure it's turned off.


## PulseOn OHR Tracker

### Pre-study
{: .no_toc }

1. Charge the device via USB until it is fully charged (as indicated by the battery indicator reaching the top of the outer rectangle in the battery logo).
2. Sync the device with a mobile phone using the 'PulseOn Demo' application
3. Unplug, put back in the wristband.
4. Turn the device off, and it is ready to send.

### Post-study
{: .no_toc }

1. Remove device
2. Clean device
3. Sync device with mobile phone
4. Turn off device by holding down button for approx. 12 seconds (the power symbol displays after about 8 seconds, and you have to keep the button pressed until turned off).
5. Charge device
6. Export data from PulseOnOHR SQL database using 'DB Browser for SQLite': (i) adl data; (ii) raw data; (iii) cont data.

## Withings Move-ECG

### Initial setup
{: .no_toc }

1. 

### Pre-study
{: .no_toc }

1. Open HealthMate on a mobile phone.
2. Sync the device with a mobile phone using the 'PulseOn Demo' application
3. Unplug, put back in the wristband, and it is ready.

### Post-study
{: .no_toc }

1. Remove device
2. Clean device
3. Sync with mobile phone
4. Sync mobile phone with cloud
5. Request data export by logging in to the [Withings Healthmate website](https://healthmate.withings.com/), clicking 'Settings', selecting the user, then clicking 'Download my data'.
6. Download data

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

1. Clean device
2. Attach via USB to Windows PC
3. Copy across `PulseOnOHR\pulseon_ohr_... .sqlite` database file
4. Do not remove until fully charged
5. Turn off device
