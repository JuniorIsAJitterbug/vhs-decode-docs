# Deployment of Capture Hardware


Please read [The Tap List](004-The-Tap-List.md) / [Hardware Installation Guide](Hardware-Installation-Guide.md) / [VCR Reports](VCR-reports.md)

Information on various VCRs that have been documented alongside high resolution pictures of VCR's that have had RF taps installed, guidance on recommended cables/connectors & tools to use are also included.

If you have digital formats please read [The Digital Tape Guide](Digital-Tape-Guide.md)


## VHS, SVHS, Umatic, Betamax, VCR, EIAJ, SMPTE-C, SMPTE-B


First find a working VCR or VRT unit!

- Check Model Number with [The Tap List](004-The-Tap-List.md)
- Unplug unit, Open-Lid via screws (watch your hands on metal rims of covers)
- Clean Heads, Drum, Guide Rollers, Remove head cleaner if present.
- Re-lubricate and clean internals if dusty and or contaminated
- Find video and or audio tests points.


## Video8, Hi8 


If you have a VCR this is the same as the above formats, if you have a camcorder you will need a Jig board (most units are jig compatible)

- Check Model Number with [The Tap List](004-The-Tap-List.md)
- Remove back cover & check pin count
- Order 2.54mm Jig Boards & Cable
- Read service manual to find out Signal/Ground pins
- Plug & Play

if your unit is compatible, we recommend Digital8 camcorders due to there better S-Video output, but also ability to save RCTC timecode and date information to the DV25 FireWire stream.

Unlike other formats Audio/Video/Timecode is all one one signal RF Signal which means 1 and done for RF capture via a 28msps or faster ADC device, alongside conventual methods for preserving the secondary data and providing a reference file.


# RF Tapping General Info 

The setup process for RF capture involves running a short cable internally from points that provide the unprocessed video and or audio signals to a BNC jack at back of a metal/plastic VCR chassis or threaded out a vent, this allows direct access to the FM RF signals conveniently & reliably, we call this a Tap Point or RF Tap, for some decks and camcorders however Dupont connectors and ribbon jigs can be used.

VCR ==> Head Drum ==> Amplification & Tracking ==> FM RF Test/Signal Points

FM RF Capture ==> Software Decoding ==> Lossless TBC Files ==> Audio/Video File Creation.

### Finding Test Points - There Names


**Video FM RF Signal:**

`RF C`, `RF Y`, `RF Y+C`, `V RF`, `PB`, `PB.FM`, `V ENV`, `ENV`, `ENVE`, `ENVELOPE`, `VIDEO ENVE`, `VIDEO ENVELOPE`

**HiFi Audio FM Signal:**

`HiFi`, `A.PB`, `A FM`, `A.PB.FM`, `Audio FM`, `A-Out`, `A ENV`, `HIFI Envelope`, `FM Mix Out`


## Parts for RF Tap


[What tools do I need?](Hardware-Installation-Guide.md)

* 50ohm BNC connectors, normally a [premade bulkhead](https://www.aliexpress.com/item/4000981154513.html), or [solderable thread mounted](https://www.aliexpress.com/item/4000639816847.html).
* 50-100cm of [RG316](https://www.aliexpress.com/item/32726071013.html) or [RG178](https://www.aliexpress.com/item/32879341402.html) 50 ohm coaxial cable.
* 10uf Capacitors [standard assorment](https://www.aliexpress.com/item/1005003276169319.html?) or audio grade like Nichicon if you like.

Connection Cables

* [Direct BNC to BNC](https://www.aliexpress.com/item/32530974771.html?) 
* [50Ohm BNC to BNC Cable](https://www.aliexpress.com/item/1005004558208116.html?)
* [S-Video to BNC](https://www.aliexpress.com/item/1005003333398231.html)

On CX White Cards you use the S-Video Luma pin for the RF input, but a BNC can be easily added.


## Install A RF Tap


[Hardware Installation Guide](Hardware-Installation-Guide.md) Goes over the install steps for VHS Decks to Sony 8mm camcorders.

If you want to still use live playback or are using lower signal decks adding an 10uf (3.3uf to 100uf range) capacitor to the test point or amplifier can stop dropouts and improve signal level, avoiding dropouts.

Centre is Signal, Outer is Ground, this goes for jacks and for coaxial cable in general.

The Negative leg (shorter) goes on test/signal point, Positive leg (longer) on cable to connector/probe

While type and voltage does not matter much its best to use new/tested capacitors.

## Notes:

**Note** We use AliExpress links for wide availability globally, but local venders are a thing.

**Note** With some Sony decks you can use Dupont connectors on the test point pins making an easy RF tap.

**Note**  Do not make sharp bends in any RF cabling, keep total cable runs as short as possible Ideally 30-60cm, more cable = more signal loss.

**Note** Some UMATIC decks have an RF output on the back, however this only provides Luma RF for dropout detection and not the full signal required for RF capture.


# CXADC Basic Use 


To see if you have a connection, use the live preview mode and then hook up your RF cable, normally you will see a white flash as a signal, if not change your vmux or input within a 0-2 range with the below command.

    sudo echo 0 >/sys/class/cxadc/cxadc0/device/parameters/vmux

To see a live preview of tape signal being received by a CXADC card, note that the video head tracked signal will be unstable or wobbly if settings are not the same; you may only see "signal flash" if in 16-bit mode for example.

This is quite useful if you don't own a CRT with Horizontal/Vertical shifting, as it will allow you to inspect the full area for alignment and/or tracking issues.

PAL framing for the default 28.64 MHz/8-bit mode:

    ffplay -hide_banner -async 1 -f rawvideo -pix_fmt gray8 -video_size 1832x625 -i /dev/cxadc0 -vf scale=1135x625,eq=gamma=0.5:contrast=1.5

NTSC framing for 28.64 MHz/8-bit mode:

    ffplay -hide_banner -async 1 -f rawvideo -pix_fmt gray8 -video_size 1820x525 -i /dev/cxadc0 -vf scale=910x525,eq=gamma=0.5:contrast=1.5

Capture 30 seconds of tape signal using CXADC driver 8-bit samples

    timeout 30s cat /dev/cxadc0 > <capture>_CXADC.u8

For 16-bit, simply change the output filename extension to `.u16`

For FLAC captures, set the output filename extension to your desired tape format, for example `.VHS`

It is recommended to use a fast storage device with 40-100 MB/s or faster write capacity, in order to avoid dropped samples, ideally an dedicated SSD (via M.2 or SATA connector, not USB) formatted with the exFAT filesystem.



