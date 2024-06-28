---
title: Quick Setup Guide
---

## Read the Readme

This may sound all too common but the basic full setup of the software side is all on the readme's it does not take more than an hour to go over the readme as all and setup the software its fairly copy-paste read copy-paste.

!!! WARNING
    For Sony Video8 & Hi8 tape owners please read [Sony 8mm Formats](Sony-8mm-Formats.md) first! 

## Hardware Requirements 

For non-Linux and just people who are new to CLI or Command Line Interfaces users we recommend [Linux Mint Cinnamon](https://www.linuxmint.com/download.php) over Ubuntu if your entirely unfamiliar with Linux with a [simple setup guide](https://www.wikihow.com/Install-Linux-Mint).

The most flexible capture and decode setup will be with Linux, but MacOS/Windows are entirely workflow supported for decoding and exporting to video files.

Any standard decent office PC from 2008-Current day should be powerful enough to capture, but decoding will run on anything but more modern systems such as a Apple Arm M series systems or Ryzen 7000 will decode a lot faster then any lower end system.

Storage:

- 500GB-2TB SSD (NVME is ideal but SATA works fine)
- 8-22TB HDD (WD/Seagate/HGST etc)


## Decode Software 


There is 2 ways to use the decode software suite, self-contained or built locally.


- [Linux Install Docs](Linux-Build.md)
- [Windows Install Docs](Windows-Build.md)
- [MacOS Install Docs](MacOS-Build.md)

!!! TIP
    If making archives you will want to bundle the source code and self-contained binary's.

- [Demo Media to Test](Submitting-&-Downloading-Sample-Data.md)


## Basic Command line Guide


[Universal Command List](Command-List.md)

A "directory" is simply a folder in the system.

`cd`  To enter into an directory.

`cd ..` To go back an directory.

`./` Runs a script or application in a local directory. (Linux/Unix)

`CTRL + C` Kills the current process in a terminal.

In WSL2 & most Linux install use cases open an terminal and paste `cd vhs-decode` is the only non decode software command needed to remember after setup as this enters into the directory rest is as simple as copy paste edit commands and drag and drop file handling you just need a text editor to edit your commands for copy paste.


## Naming Your Captures


Its recommend to use the [standardised naming guide](https://docs.google.com/document/d/1MZkBUmwyugljB2uJONPhKLsbcQLz2Q5Glr98EF31XbI/edit?usp=sharing).


## Quick Capture & Process Basics


RF Capture--> FLAC Compress --> Archive 

RF Capture --> Decode --> Inspect --> Export 


## DomesDayDuplicator "DdD" Setup


Fabricate --> Flash DE0 & FX3 boards --> Install USB Driver --> Open App & Capture

!!! NOTE
    Has sample drop issues on Windows for 99% reliability use MacOS or Linux install for initial captures.

If you have an DomesDayDuplicator you don't need to care about Linux past live install and having an exFat formatted HDD drive to move the data cross operating systems. 

Decode workflow is 3-4 commands commands for the most part, for a plug and play setup today using a DdD + RTLSDR is fairly standard, but CX Cards with the Clockgen mod is more affordable and automatable.

GUI is simple for the DdD it tells you how long it runs just to make sure it's in 10-bit packed mode making an `.lds` raw file you then compress it to a `.ldf` 16-bit FLAC file.

Capture runtime limiting and capture time with storage space available is shown in the GUI application.

![](https://github.com/happycube/ld-decode/wiki/assets/hardware/Domes-Day-Duplicator-Capture-App-Live-Capture.gif){: style="width:400px"} 


### Software Control Options:


40 MHz 16-bit Signed Scaled  Output is `.raw` **(Recommended Mode To Use For HiFI Currently)**

40 MHz 10-bit Packed Unsigned Output is `.lds` **(Recommended Mode To Use)**

!!! CAUTION
    10 Mhz 10-bit Packed Unsigned (4:1) is `.cds` not supported by toolchain do **not** use this option.


### Compress Capture Down


(replace <capturename> with the name you wish to use with your media capture)

Run `ld-compress capture-name.lds` in Linux/MacOS with your `.lds` file in the vhs-decode scripts directory or anyware if installed on path.

For Windows there is compression scrips with `.bat` files drag en drop to compress DdD or CX Card files.


## CXADC (Stock 28mhz Card)


!!! NOTE
    Requires a hardware installation of Linux on a desktop or laptop with external PCIe 1x slot or bandwidth available.

`Shutdown System` --> `Unplug` --> `Physically Install into PCIe slots` --> `Plug back in` --> `Power on.` --> `Install Driver` --> `Restart` --> `Use Driver`.

[CXADC Wiki](https://github.com/happycube/cxadc-linux3/wiki) for overview information path.

Driver install and use of CXADX is 100% covered in the readme for it. 

`Find VMUX` --> `Test Capture` --> `Decode Test Capture`

`./leveladj` sets the gain level best to start the tape a few seconds in to set the gain then rewind and begin full capture, this can be ignored if amplifiers are employed in the capture chain as you can set gain to 0 and pretty much ignore it.

There is a [GUI Alpha App](https://github.com/tandersn/cx_capture_app) that can make life easier.

Rule of thumb always sample higher then required if using a stock card 28msps 8-bit mode is the go to.

!!! CAUTION
    **Do not use 35mhz 8-bit** as it's just up-sampling data and wasting space.


### Compress Capture Down


## [FLAC Compression Command List](https://github.com/happycube/cxadc-linux3/wiki/FLAC-Compression-Guide)



In technicality, you can down sample to 6-bits before any real world information loss occurs, but the ideal clock and sampling rate for CX Cards is 40mhz or 40msps 8-bit to make the most of the 10-bit ADC chip for initial captures, however for space-saving down sampling to 20msps 8-bit is a treading standard but has risks of causing issues for out of spec captures and SoX on windows can generate invalid data.



## Fine Adjustments


With VCRs assuming no major issues you have 2 main controls physical tape guides and digital tracking IC control, now tracking is normally manipulatable via a knob on a pro deck and channel up/down on prosumer deck front panels, or via remote if you have the remote, however, if its physical guides not aligned you will need to adjust them until the tape plays within spec.

A CRT TV or video monitor is generally recommended as you can view tapes directly without any need for any digital processing/stabilisation however this is a manual observation method and consumer CRTs with under scan modes are a recommended minimum as most consumer units have cropped edges/bottom head switch area of the video so Sony/JVC PVM/BVM style monitors with there horizontal/vertical shift and under scan modes are preferable, but any old later Sony Trinitron, for example will work fine for most peoples needs.

![](assets/images/Hardware/HV-Shift-WSS-16.9-Sony-ILCE-7RM3-2023.02.01-12.33.43.jpg){: style="width:400px"}


## RF Tap points


On most VCRs you have test points next to each other or by the conventional video outputs, if you're going to modify your consumer/prosumer VCR its worth installing a couple more BNC's and cables to signal points such as head switching, for SCART only decks this is an opportunity to add CVBS in/out etc.

When the term "tap point" is used think signal output connection point, a cable soldered at a test point or signal path point using a cable like RG316 or RG178 to a mechanically secure bulkhead, or to a jig boards for camcorders.

!!! IMPORTANT
    The **centre wire is signal** and the **outer wrapping wire is ground** coax is much loved as it provides basic RF shielding and is not only cheap but universally available worldwide.
    `RED = Pos/+/Signal/Live` & `BLACK = Neg/-/Ground/Return` 


Test points normally will be called the following:

`RF Y, RF C, RF Y+C, PB, V RF, V ENV, ENV, ENVELOPE, VIDEO ENVE, VIDEO ENVELOPE` - Video RF

`RF-Out, A-RF, HIFI RF` - Audio RF

`A.Out` - Linear Baseband

!!! IMPORTANT
    Don't forget about **Ground** - There is normally always a common ground point nearby or ground shield that can be soldered to as a ground all RF needs a return path proper grounding matters!


## RF & Reference Capture Setup


!!! NOTE
    With a 10uf capacitor in-line de-coupling the test point, you should be able to capture RF and conventional normal baseband i.e CVBS or S-Video output at the same time with virtually no affect on RF or standard video output.

Having a conventional capture and viewing for reference is very useful to understand the state of a tape and possible errors like tracking, audio sync and damaged segments. 

- CRT or Digital TV with S-Video/CVBS/SCART
- DMR-ES10 / ES15 or equivalent signal passthrough stabiliser. (if no remote press eject then external link up/down on DMR units)
- EasyCrap/BlackMagic SDI or GV2-USB (or even CVBS to HDMI to HDMI to USB)

You can have a complete reference capture setup for around 50USD or less globally if you look around properly.



## Storage Solutions!


Allocate 500GB to 2TB of storage 100MB/s Write Speed Safe Minimum.

For affordable local storage:

`Western Digital (WD)` make EasyStores/Elements lines

`Seagate` makes Desktop/Backup lines 

These are great mass storage drives, however, do not use the included USB caddy and you may need a simple Molex to SATA power adapter due to power pinning standards used on the drives to use on desktops, USB caddies are not preferred for mass storage nor is keeping it some ware it can be physically knocked common sense and keeping critical equipment off USB is hand in hand as USB bus data is a shared system ware as SATA to SATA is direct and unaffected, however, if using USB don't use the included adapter as that makes the drive crippled in terms of being able to use it in a desktop it after the fact without copying or deleting all the data off.

There is a ["shucking"](https://www.ifixit.com/Guide/How+to+Shuck+a+WD+Elements+External+Hard+Drive/137646) community around these drives due to the low cost per gigabyte new 14TB+ units should be server-grade drives as some 8TB drives are now lower grade on the WD side.


## Cloud Services 



[Backblase](https://www.backblaze.com/cloud-backup.html) Personal Backup Plan *7USD/m

However for testing or interesting signals & issues you encounter feel free to store them on the [Telegram Group](https://t.me/decodeteam).

Please be sure to read and use the [Submission Guidelines Naming System](https://docs.google.com/document/d/1MZkBUmwyugljB2uJONPhKLsbcQLz2Q5Glr98EF31XbI/edit?usp=sharing) this ensures sanity of knowing what files are what format.


## Creating Archives and Preservation


[Media Archive Guide](Media-Archival-Guide.md) & [LTO Tape Guide](LTO-Linear-Open-Tape-Guide.md)

Currently, we only have M-Disk & DataLifePlus, DM Archive as a solid archive format widely alliable using the standard Blu-Ray format

`25GB SL`, `50GB DL`, `100GB TL` & `128GB Sony` 

These discs are not affected by humidity/thermal shifts/radiation and magnetic forces if stored in a crush-proof environment these disks will last better then factory stamped non-dye disks decades if not up-to "1000" years when the polycarbonate plastics start de-bond.

Once written all modern DVD/BluRay readers/writers & players support the UDF data format, which can be read on PC/Mac/Linux/Android and even IOS with some select Blu-Ray readers that have file system translation modes.

[Amazon US](https://www.amazon.com/gp/product/B017H13DFS/) / [Amazon UK](https://www.amazon.co.uk/gp/product/B011PIJPOC/) has a constant supply.


## Reference Diagrams


[Diagrams Visuals Page](Diagram-Visuals.md)

**Note!** open the image in another tab or download it to view full scale in case of viewing issues.

![](assets/images/graphics/VHS-Decode-Continuous-New-2023-Consumer-Workflow-16-by-9.png){: style="width:800px"}
