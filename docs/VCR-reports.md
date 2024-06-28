---
title: VCR Reports
---

This page is for initial and long term notes about VCR testing however not to be confused with [The Tap List](004-The-Tap-List.md) that has more upto-date information and images of many VCRs that don't *yet* have reports.


## (S)VHS PAL


- Philips VR900, Hitachi VT-MX730EVPS, VT-MX905EVPS (newer Philips turbo drive decks, not actually Hitachi!) 
    - oyvindln, didn't test, but found that these and related don't have an easily accessible rf test point when servicing (these are made by Philips not Hitachi I think)

- Nokia VCR3715, Luxor VCR4704 (Sanyo) 
    - oyvindln, captured ok with scope probe + DdD from pb fm on head amp, though the decks had some power supply issues so can't fully test.

- [Bush VCR925NSIL](004-The-Tap-List.md#bush-vcr925nsil-orion-made)
    - Harrypm, DdD 2.02 Gain 1x Probe No issues, Test points to 50Ohm RG316 to BNC Bulkhead, Test Points are easy to access and plenty of space for 3 Bulkheads next to A/V connections but required a 100uf electrolytic capacitor for stable RF capture (HiFi needs re-testing)


### Sony Consumer / Prosumer Models


* [Sony SLV-SE60](004-The-Tap-List.md#sony-late-90searly-2000s-slv-se60) - oyvindln, used with scope probe, worked well with both cxadc and DdD.

### JVC Consumer / Prosumer Models

- JVC HR-J681
    - oyvindln, captured fine with scope probe + DdD from pb fm, though signal seemed a bit weaker than from e.g Sony and F77.

- JVC HR-XVS20 
    - oyvindln, captured ok with scope probe + DdD from pb fm, though signal seemed even weaker than on 681, maybe a bit too much.

- JVC HR-J658 
    - oyvindln, signal too low for cxadc, doable with DdD, but not sure if the signal was strong enough for good chroma decoding (need to re-test with DdD, may have used probe in 10x mode.

- [JVC HR-S7500](004-The-Tap-List.md#jvc-jvc-hr-s7500)
    - Jitterbug, damaged deck? tested good signal for video RF required 10uf cap on test point.

- [JVC-BR-S622U](004-The-Tap-List.md#jvc-br-s622u)
    - adam_r / Ack Ack, tested will with amplifiers and 10uf caps added to test points.

### Panasonic Consumer / Prosumer Models

- [Panasonic NV-HD630](004-The-Tap-List.md#panasonic-hd630b) 
    - harrypm, DdD Min Gain, RTLSDR, RG316/BNC taps with 10uf caps, duel HiFi tap and RF-C test point taps, stable and high SNR captures obtained.
    - zcooger, Green CX Card (CX23883-39)(CXADC), Head Amp tap, RG58 cabling used, electrolytic caps in-line 4.7uf stable captures obtained.
    - jitterbug, CX White (CX23883-39), TW502 HiFi + video, TW501 no HiFi (or too low?), TW2001 HSW, head amp tap pin 4 video, pin 13 HiFi, pin 2 HSW (pointless). Video should be tapped after the resistor/on the pin else worse signal, HiFi requires 100ohm resistor else worse signal.

- Panasonic NV-SD200 
    - oyvindln, captured ok with scope probe + DdD from pb fm on main board, but got some slight interference (Probably due to me connecting to the ground too far away, should presumably be fine otherwise).

- Panasonic NV-F77 
    - oyvindln, captured fine with scope probe + DdD from both rf c and rf y outputs (not sure which is best), cxadc not tested.

- [Panasonic NV-HS950](004-The-Tap-List.md#panasonic-nv-hs950b) 
    - harrypm, head amp & tbc card env tap tested, requires a capp added in-line to allow standard playback and stable SVHS capture, tested well on DdD directly 2.02 Gain and 1x probe, CX Blue card as well, cracked solder joints inside headlamp board required re-flowing.

- [Panasonic NV-HS1000](004-The-Tap-List.md#panasonic-nv-hs1000) 
    - Itewreed#2179, direct head amplifier ''pin push-in'' tap 10uf electrolytic capacitors used cable ground soldered to amplifier shield, BNC's mounted at the back, video RF and HiFi RF working.    

### Panasonic AG (Professional line)

- [Panasonic AG-5700](004-The-Tap-List.md#panasonic-ag5700) 
    - oyvindln, captured ok with scope probe + DdD from env TP on top board, at back on hinge side (Gives RF C out from head amp + 0.1 uf cap)

- [Panasonic AG-5260](004-The-Tap-List.md#panasonic-ag-5260-compact-k-mech) 
    - Harrypm, ENV Test point (top board) needs 10uf Cap, HiFi RF is just called ENV at the back near standard A/V output left channel is low (high pass filter?), Note very stable transport and tracking with clean freeze frame and fast-forward playback decodes fine if tracking is adjusted correctly during a slow advance.

- [Panasonic AG-7150, AG-7350](004-The-Tap-List.md#panasonic-ag-7150-professional-3u-rackmount-player) 
    - Harrypm, First board V1, TP4 ENV Video with TP Ground next to it under plastic cover tests fine without any caps needed in-line with VHS, ( need to do SVHS SP) via DdD 2.02 Gain and 1x probe, Audio board A2 TP707 (TP4707 In manual) underneath plastic retaining clamp, left channel is low (high pass filter?).
    - Rene Wolf, Head head amplifier tap with amplifier board, and duel sync CX White (CX23883-39), HiFi working via direct taps. 

- [Panasonic AG-7350](004-The-Tap-List.md#panasonic-ag-7150-professional-3u-rackmount-player) 
    -  Harrypm, Same as Panasonic AG-7150 for playback (just recording to tape components are populated on the A/V boards, and head amplifier pins)

- Panasonic AG-7650
    - Harrypm, Testing to be done. (notation)

- [Panasonic MD-830](004-The-Tap-List.md#panasonic-ag-md280) 
    - Harrypm, Testing to be done when serviced. (notation)


## (S)VHS NTSC


### Sony Consumer / Prosumer Models


- Sony SLV-677HF 
    - drfsupercenter#1337 PB RF output is fantastic, with CX card the gain is usually somewhere in the middle to max out the signal. It may be possible to easily capture Hi-Fi audio, but I haven't tested. Head switch adjustment test point is also easily accessible on the left side of the motherboard; does not remember your adjustments after power loss.

- Sony SLV-685HF 
    - drfsupercenter#1337 PB RF output is very similar to 677HF. Main difference with this model is that it has an EEPROM for storing the head switch position so you can unplug and it won't reset. The test point to do the adjustment is slightly more annoying to access as it's somewhat buried, but still possible without dismantling. Hi-Fi audio may be tappable but will require soldering; not a jumper pin like the PB RF.

- Sony SLV-N50 
    - drfsupercenter#1337 PB RF output is very quiet with CX card the gain had to be almost fully maxed out to get a strong signal. Also, you CAN NOT tap Hi-Fi output on this VCR as it's too new and uses an IC. **Would recommend avoiding and going with one of the older models.**


## BetaMax PAL


- [Sanyo VTC5000](004-The-Tap-List.md#sanyo-vtc5000) 
    - Harrypm, DdD 1x Probe to ENV test point (first pin to the left of shielded PCB) 2.02 Gain initial tests decoded fine, however, dropouts with PVM connected requires capacitor in-line for real-time conventional alongside for audio/reference used 100uf without issue for permanent tap.

- [Sony SL-C40 ES](004-The-Tap-List.md#sony-sl-c40es) 
    - phelissimo_#0292, 


## BetaMax NTSC


## Sony 8mm 


### VCR's

- [Sony Video8 EV-A60](004-The-Tap-List.md#sony-video8-ev-a60-ntsc)
    - Titan91, 2.54mm header pins DuPont Tap.


### Camcorders


Sony camcorders are tapped via jig points [Sony 8mm Formats](Sony-8mm-Formats.md), this can also apply to some Samsung units too.

- [Sony HI8 CCD-TRV318]()

- [Sony Digital8 DCR-TRV315]()

- Sony DCR-TRV355E 
    - Jitterbug, low signal, requires cap, may require amp (further testing required). Uses a 16 pin 0.5mm FPC for tap, PB RF pin 2

- [Sony Digital8 DCR-TRV840, DCR-738E](004-The-Tap-List.md#sony-digital8-dcr-trv840-video8--hi8-ntsc)

- [Sony HI8 CCD-TRV328]()
    - kaliohelix#5414, Direct solder to AGC pin, Due to the AGC (Automatic Gain Control IC) the signal output level of the Raw RF is very strong no capacitors or resistors are required in line for solid captures to be made on the CX or DdD.

- [Sony Digital8 DCR-TR8000E]()
    - harrypm, required 10uf cap, solid reliable signal at 8.5 gain on the DdD, black SNR of 45-48 dB on tapes tested with current code as good if not better then S-Video reference, Uses a 20 pin 0.5mm FPC for tap, pin 5 PB RF, Pin 6 GND.


## Of Interest - Harry Munday


World Wide Multi-Region Players, W-VHS decks.


## Notes 


[Sony Test Point Voltage Level](https://discord.com/channels/665557267189334046/782578245408653313/1078729904419504168)

Im not sure how much this matters but I think all these SONY VCRs have 200mV Pb RF test points which is a big waveform because it says that in their service manuals and I got a few different NTSC models in the list that I confirmed are large waveforms:

rmt-v154c, rmt-v158, rmt-v161, rmt-v162, rmt-v164b, slv-733hf, slv-733hfcs, slv-733hfmx, slv-733hfpa, slv-740fpx, slv-740hf, slv-741hf, slv-780hf, slv-781hf, slv-940hf, slv-940hfcs, slv-940hfmx, slv-940hf, 

SLV-E325EG/E475EG/E570EE/E570EG/E715B/E717VC/E720B/E720BZ/E720EE/E720EG/E720EX/E720NC/E720NP/E720UX/E720VC/E720VP/E725NC

RMT-V197/V197A/V197B/V198/V198A/V198K/V198J/V199/V199A

&

SLV-E580EE/E580EG/E630AE/E630NP/E727VC/E730B/E730EX/E730NC/E730NP/E730UX/E730VC/E730VP/E735B/E735NC/E735VC/E780EE/E780EG/E780EN * All model names SLV- E580, E630, E727, E730, E735, E780  E580EE E580EG  RMT-V220B/V221D/V223/V223A/V223B/V224/V224C SLV-E780 E580 E630 E630AE E630NP  E727 E730 E727VC E730B E730EX E730NC E730NP E730UX E730VC E730VP AEP Model French Model East European Model SLV-E580EE/E780EE Middle European Model SLV-E580EG/E780EG/E780EN North European Model SLV-E730NC/E735NC Irish Model Spanish Model SLV-E630NP/E730NP German Model SLV-E727VC/E730VC/E730VP/E735VC E735 E735B E780EE E735NC E780EG E735VC E780EN.

200mVp-p +- 500mVp-p
