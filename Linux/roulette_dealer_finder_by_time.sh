#!/bin/bash

#The following script will analyze employee schedules to find roulette dealers specific times.
#Notes: This can accept two arguments (date & time), and cannot accept AM or PM.

grep $2 $1_Dealer_schedule | grep $3 | awk -F" " '{print $5" "$6}'
