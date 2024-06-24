## How a VCR works

Magical Magnetic Tape, Little magnets flying around on a drum.

## Recorded on Media

TV Station --> Composite signal 525/625 line signal --> Communications System --> FM Modulation --> Broadcast via Antenna or Ground Coax --> Received by VCR --> De-Modulated Composite/NICAM HiFi --> Amplification & Processing boards --> Modulated for Tape Format --> Signal Sent to Video/HiFi Heads --> Magnetised in strips on magnetic tape.

Composite signal (525/625 line) from device or camera --> Amplification & Processing boards --> FM Modulated for Tape Format --> Signal Sent to Video/HiFi Heads --> Magnetised in strips on magnetic tape.

## Recorded to Media 

Video Tube or CCD Image Sensor / Analogue Microphone --> Analogue/Digital Processing ICs --> Modulated Amplified Signal --> FM Modulated for Tape Format --> Signal Sent to Video/HiFi Heads --> Magnetised in strips on magnetic tape.

Baseband Composite/S-Video signals are also output live from the video IC.

## Playback From a VCR 

Tape moving over heads --> Heads reading signal --> Amplified & Tracked by ICs --> Demodulation & Filtering --> Time Base Correction --> Composite/S-Video Output

Time Base Correction is done directly after demodulation inside VCRS with a TBC but is done after full processing with external TBC's.

# Capture 

## CVBS - Composite & S-Video 

Takes the processed signal from a VCR out of the baseband Composite or CVBS output, S-Video is Y/C separated and can yield cleaner results.

## FM RF 

Takes the unprocessed signal from a VCR before the filtering & demodulation stage, this is right after the pre-amplifiers or amplification stage.

Tape Inside VCR --> Tape Heads --> Signal Amplification & Tracking --> FM RF Signal Test Points --> Demodulation and filtering boards --> CVBS Baseband Signal

## Baseband Hardware 

So anyone who is 1-2 days into this rabbit hole will have found Blackmagic Analogue to SDI / AJA Analogue to SDI / Magewell AIO etc etc there are desktop and usb versions of these capture devices, but while yes they all use the analogue devices [ADV8472](https://www.analog.com/media/en/technical-documentation/data-sheets/adv7842.pdf) chips while they pretty much the end of the analogue all-in-one processing IC's if you give it enough ram for its TBC/Frame Store its very good but its still a baseband capture granted an over 8 times oversampled one but its still limited to the initial processing made by the VCRs filtering and demodulation boards.