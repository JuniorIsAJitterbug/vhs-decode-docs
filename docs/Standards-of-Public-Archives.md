# Archive Standards Doc 


This doc is for presentation of preservation standards for public archives.



# IA Standard #001 


Internet Archive Upload Standard #001 - Analogue Tape Media

[Munday Demo Tape](https://archive.org/details/vhs-decode-munday-demo-tape-2022) & [Dialog 2001 Archive](https://archive.org/details/dialog-2001-vhs-capture)



## Time and Date 


DD.MM.YYYY HH.MM.SS - Universal

(MM.DD.YYYY USA system is just illogical, please don't use it)


## Folder Structure


Archive Name / Tape Name etc 

     Notes.txt
     RF Data    --> .LDF / .u8 / .u16 / .flac
     Software   --> LD-Tools / VHS-Decode - Windows
     TBC Files  --> TBC Data / LOG / JSON
     Video Data --> FFV1 (10-bit or 8-bit .mkv)
     Audio Data --> FLAC (.flac)


## RF Technical 


Native sample rate should be correctly stated an flac compressed.

If re-sampled it should be stated size of original and or if possible upload original too.


## Video Technical: 


Codec:     `FFV1`

Croma-Subsampling: `4:2:2` 

Bit Depth: `10-bit` or `8-bit`

Container: `MKV`


## Audio Technical: 

Codec: `PCM` or `FLAC`

Bit Depth: `16-bit Integer` / `24-bit Integer` / `32-bit Float`

Rate: `48khz` / `192khz`

Container: `.flac` or `.mka`


## Proxy Media


Making Proxy media for Odysee/Internet Archive is ideal for quick streaming.

8mbps Web

    HEVC/AVC 8mbps 4:2:0 10-bit in `.mov` QuickTime container.

Blu-Ray (high bandwidth web)

    AVC 28mbps 4:2:0 8-bit in `m2ts` Blu-Ray compliant container.

If de-interlacing such as QTGMC, BWDIF or IVTC is used it should be stated and original interlaced versions should always be included to meet full-set standards.

Resolution can be conformed to 

`720x480 NTSC` / `720x576 PAL` - If no VBI data is present.

`720x512 NTSC` / `720x605 PAL` - If VBI data is present.


## Standard Media Template Description (RF Only)


This archive is an FM RF copy of the analogue format [Insert name] this was captured with [Insert Device] at [Insert MSPS] this is the original signal off of the medium before processing past initial signal tracking and pre-amplification a raw master digital copy or medium transfer.

Format: VHS, Video8, SMPTE 1" Type-C (and so on)

TV System: NTSC/PAL/SECAM 

Colour: Yes/Monochrome (No)

Runtime: Hours:Minutes:Seconds:Frames 00:00:00:00

Audio: Yes/No (If Applicable)

Included in this archive is the RF information, log notes [If any] and a self contained binary for the Windows 10 operating system alongside a example decoding command.


## Standard Media Template Description (Full-Set)


This archive is an standard full set for demonstration and archival use, this includes a copy of the analogue format [Insert name] this was captured with [Insert Device] at [Insert MSPS] this is the original signal off of the medium before processing past initial signal tracking and pre-amplification a raw master digital copy or medium transfer.

This also includes de-modulated and time base corrected 4fsc Composite or Y/C .tbc files openable with ld-analyse, and a video file export for standard viewing.

- Format: VHS, Video8, SMPTE 1" Type-C (etc)
- Speed i.e SP or LP (if applies)
- Cassette / Tape type (if known)
- Recording Date: 24.07.2009 
- Digitisation Date: (date of RF capture)
- Format: VHS-SP (VHS-C Cassette Type for example) 
- Capture Format: FM RF (40msps) (Compressed in FLAC)
- VCR Used:  Brand Model Year etc 
- TV System: NTSC/PAL/SECAM etc
- Colour: Yes/Monochrome (No)
- Runtime: Hours:Minutes:Seconds:Frames 00:00:00:00
- Audio: Yes/No (If Applicable)


### Checksums: 


Included in this archive is the RF information, log notes [If any] and self contained binary's for the Windows 10 operating system alongside a example decoding command.

- Checksum Format: SHA3-512. (or MD5 etc)

Please visit the project GitHub if you wish to obtain newer versions of the decoders and other tools and or more information past limited example use presented here.

https://github.com/oyvindln/vhs-decode/wiki#FIXME


## Release Media 


For lost or fallen into obscurity media, IMDB and other metadata providers can provide basic synopsis etc

If possible scan the cover and or any artwork for the media saving it as lossless PNG or TIFF, DNG can also work.


## Indexing Keywords & Tags


Copy this set of keywords `;` is the legal separator if you wish to add your own.

Internet Archive:

`VHS;VHS-Decode;ld-decode;ld-analyse;hifi-decode;cvbs-decode;vhs decode;analogue;analog;composite;s-video;.tbc;tbc;time base correction;timebase corrector;timebase corrected;time base corrected format;FM RF;FM RF Capture; FM RF Archive;FFV1;sdr;software defined video decoding;software defined audio decoding;teletext;vbi data;media archives;tv archives`

`VHS;VHS-Decode;teletxt;vbi data;media archives;tv archives;software defined video decoding;FM RF Capture`

Instagram:

`#vhs #supervhs #beta #betamax #video8 #hi8 #tapes #tape #vhsdecode #laserdisc #lddecode #fm #rf #tbc #timebasecorrector #timebasecorrection #analogue #analog #archives #archiving #software #softwaredevelopment #softwaredeveloper #sdr #radio #gnuradio #opensource #opensourcehardware #opensourcesoftware`

YouTube:

`ADC, analog, analogue, analog to digital, AD, DA, CXADC, CX Card, CX23883-39, CX23883, SDR, Software Defined Radio, VHS-Decode, HiFi-Decode, CVBS-Decode, LD-Decode, Time Base Correction, time base corrected format, .tbc, tbc, TBC, Decode, Decode Projects, vhs, beta, betamax, video8, hi8, umatic, umatic sp, teletext, media archives, tools, composite, radio, tapes, tape, opensourcehardware, opensourcesoftware, vbi data, FFV1, timebase corrector, FM RF, FM RF Capture, FM RF Archive, FM RF Archival, software defined video decoding, software defined audio decoding, Linux, GitHub`


## YouTube or Odysee Description


Decoded videos can be presented in various ways, however de-interlaced and upscaled to 4k or 8k brackets is the best way to go for best quality outcomes on YouTube, `2880x2176` is an ideal resolution for example. 

Vimeo does not crush its files on re-encoding, Odysee is direct file upload so you can make 8mbps final render in AVC/HEVC/AV1 etc.


Description Example:

    Software: VHS-Decode commit 9bb38e46
    Deinterlacer: QTGMC faster w/bob TR2=2
    VCR: Panasonic NV-HD630
    RF Capture Device: CX23883-39 w/40msps crystal mod (20mhz/10bit)
    RF Amplifier: AD8367
    Tape: E180 SP
    Date of Recording: 13.08.1996
    Date of Capture: 11.12.2018
    
    VHS-Decode Wiki: https://github.com/oyvindln/vhs-decode/wiki/#FIXME
    VHS-Decode Reddit: https://www.reddit.com/r/vhsdecode/
    Domesday86 Discord: https://discord.gg/pVVrrxd


## Stopping Derivatives


The site will automatically try to waste space and create `derivatives` low quality mp3/mp4 files of what it thinks is audio and video we do not want this, as it wastes there space and users time who want to download the archive.

To kill this problem simply do the following:

Create a file called:

`_rules.conf`

Containing Inside of it:

`CAT.ALL`

Save file inside your archive folder, if you upload this to older archives this will remove the derivatives already generated.

[Derivatives IA Doc](https://archive.org/help/derivatives.php)


# Uploading Your Archive 


Once you have organised your files locally and all your assets are in order you can upload your archive.

- [Web Upload](https://archive.org/create/)
- [Torrent Upload](https://help.archive.org/help/archive-bittorrents/#:~:text=Starting%20in%202011%2C%20the%20Internet,are%20available%20for%20the%20Torrent.)

Web Upload is drag & drop via there site, slow and quite unreliable at times.

Torrent upload is ware you create a page for your item and then upload a torrent `my-archive.torrent` you have created with your files locally, this will allow slow but reliable upload and verification and allows you to also directly host and share the archive.

You can create a torrent with [qBittorrent](https://www.qbittorrent.org/download) or any full featured client software.