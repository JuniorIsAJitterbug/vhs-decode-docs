## Down-sampling + FLAC Compression (Windows Commands)


Untill piping or scripting is sorted out properly these commands will live here, as not to clutter main docs or cause help issue requests. 


### NTSC - VHS/Betamax (16msps 8-bit)

    C:\ld-tools-suite-windows\ld-lds-converter.exe -i INPUT.lds | sox -r 40000000 -b 16 -c 1 -e signed -t raw - -b 8 -r 16000000 -e unsigned -c 1 -t raw - sinc -n 2500 0-7650000 | flac -8 --sample-rate=16000 --sign=unsigned --channels=1 --endian=little --bps=8 - -o OUTPUT_NTSC_16msps_8-bit.flac

### PAL - VHS/BetaMax (18msps 8-bit)

    C:\ld-tools-suite-windows\ld-lds-converter.exe -i INPUT.lds | sox -r 40000000 -b 16 -c 1 -e signed -t raw - -b 8 -r 18000000 -e unsigned -c 1 -t raw - sinc -n 2500 0-8800000 | flac -8 --sample-rate=17000 --sign=unsigned --channels=1 --endian=little --bps=8 - -o OUTPUT_PAL_18msps_8-bit.flac

### NTSC/PAL - Umatic/SVHS/SuperBeta/ED-Beta (24msps 8-bit)

    C:\ld-tools-suite-windows\ld-lds-converter.exe -i INPUT.lds | sox -r 40000000 -b 16 -c 1 -e signed -t raw - -b 8 -r 24000000 -e unsigned -c 1 -t raw - sinc -n 2500 0-9400000 | flac -8 --sample-rate=20000 --sign=unsigned --channels=1 --endian=little --bps=8 - -o OUTPUT_24msps_8-bit.flac

## HiFi FM Audio

    C:\ld-tools-suite-windows\ld-lds-converter.exe -i INPUT.lds | sox -r 40000000 -b 16 -c 1 -e signed -t raw - -b 8 -r 10000000 -e unsigned -c 1 -t raw - sinc -n 2500 0-3050000 | flac -8 --sample-rate=10000 --sign=unsigned --channels=1 --endian=little --bps=8 - -o OUTPUT_HiFi.flac


## Tools

### Make a spectrum graph with SoX

   sox input.u8 -n spectrogram




Resampling on windows 

ld-lds-converter & SoX

C:\decode\ld-lds-converter -i "%~1" | sox -r 40000000 -b 16 -c 1 -e signed -t raw - -b 8 -r 18000000 -e unsigned -c 1 -t raw - sinc -n 2500 0-8650000 | flac -8 --sample-rate=18000 --sign=unsigned --channels=1 --endian=little --bps=8 - -o "%~n1_18msps_8-bit.flac"



## Truncation Compression


https://discord.com/channels/665557267189334046/665834485975351307/1203054029668753538

if you did resampling, you can truncate like this to achieve the better compresison without volume change. If it was downsampling, you'd want input + 1 bits.

Truncate to 9 bits: ffmpeg -i diehard.wav -af volume=volume=0.0078125:precision=fixed,volume=volume=128:precision=fixed diehard_re.wav
Truncate to 10 bits: ffmpeg -i diehard.wav -af volume=volume=0.015625:precision=fixed,volume=volume=64:precision=fixed diehard_re.wav
Truncate to 11 bits: ffmpeg -i diehard.wav -af volume=volume=0.03125:precision=fixed,volume=volume=32:precision=fixed diehard_re.wav
Truncate to 12 bits: ffmpeg -i diehard.wav -af volume=volume=0.0625:precision=fixed,volume=volume=16:precision=fixed diehard_re.wav
Truncate to 13 bits: ffmpeg -i diehard.wav -af volume=volume=0.125:precision=fixed,volume=volume=8:precision=fixed diehard_re.wav


so if you did a 12 bit MISRC capture, then resampled it to 20 MHz, you'd want the 13 bit one