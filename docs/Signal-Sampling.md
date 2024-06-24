# Nyquist Sampling


1mhz = 2msps of minimum sampling so a 2:1 ratio

Less is worse more is better. 

The best layman's example of this is HiFi 20hz to 20khz (Witch is around the average human hearing range) CD audio is digital 44.1khz just over 2:1 sampling, so 48khz covers the entire range of human speech, ware as 192khz would cover an large array of multiple sound information points like a orchestra.

* kHz is 1000hz
* mHz is a million Hz
* MSPS is million samples per second

Oversampling is just the practice of capturing far more information then the potential of the source information, this just wastes space in simple terms and is always the preference to underdamping ware signal information is lost. 


# 4fsc


Four times the frequency of SC (sub-carrier).

The digital sampling rate of a composite video signal with respect to the sub-carrier frequency of an NTSC or PAL analogue video signal.

The 4fsc frequency sample rate is defined based off full spec composite

### NTSC (SMPTE 244M)

FPS: 29.97

14.31818182 MHz (4x 3.579545455 Mhz)

Full Signal Frame: 910x525

Active Picture Area: 720x480

### PAL (EBU 3280)

FPS: 25

17.734475 MHz (4x 4.43361875 Mhz)

Full Signal Frame: 1135x625

Active Picture Area: 720x576


# Sub-Carrier


A subcarrier is a sideband of a radio frequency carrier wave, which is modulated to send additional information.

Examples include the provision of colour in a black and white television system or the provision of stereo in a monophonic radio broadcast. There is no physical difference between a carrier and a subcarrier; the "sub" implies that it has been derived from a carrier, which has been amplitude modulated by a steady signal and has a constant frequency relation to it.

In simple terms, lets say you have a 5mhz signal, inside this you have audio at 1.2mhz for left and 1.8mhz for right 2.2mhz has a timecode signal and 4.5mhz has the video signal all these signals are modulated

Some good real world examples is the HiFi carrier positions on common video tape formats. 


### VHS HiFi

Left 1.3Mhz / Right 1.7mhz

### Video8 & High8 HiFi

Left 1.5Mhz / Right 1.7Mhz

### Beta HiFi

Left is 1.38Mhz A head & 1.53Mhz B head

Right is 1.68Mhz A head & 1.83Mhz B head


# Good Book Exurbs


Exurbs From Digital Video and HD Algorithms and Interfaces 2nd Edition (By Charles Poynton 2012-02-07)

Pages 162 to 180

The following pages give a clear explanation of what 4fsc, S-Video, and Chroma Sampling are, witch are the core surface concepts to understand the processing chain of software tape decoding and how analogue is presented in the digital domain.


## 4fsc

Four times the frequency of subcarrier, this is normally based off the composite signal standard for PAL/NTSC.

The 4fsc frequency sample rate is typically:

14.3 MHz (28.6 MSPS) in NTSC.

17.7 MHz (35.4 MSPS) in PAL.

In simple terms the same system used for D2/D3 tape.


![](assets/docs/Book-Extracts/Poynton/Book-02/Page-171.png#FIXME){: style="width:600px"}

> Page 171


![](assets/docs/Book-Extracts/Poynton/Book-02/Page-172.png#FIXME){: style="width:600px"}

> Page 172



# Page End


- [Technical Breakdowns](Technical-Breakdowns.md)
- [Acronyms Guide](Acronyms-Guide.md)