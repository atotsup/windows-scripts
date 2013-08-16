@echo off
set ssid="freewifi"
set key="#1@4mbk"

rem netsh wlan show hostednetwork
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%key%" keyUsage=persistent
rem netsh wlan show hostednetwork
netsh wlan start hostednetwork
