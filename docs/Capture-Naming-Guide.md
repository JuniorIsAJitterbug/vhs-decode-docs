Previous Page [RF Capture Guide](RF-Capture-Guide.md)

Sub-Page [Material Handling Guide](Material-Handling-Guide.md)

Next Page [Media Archival Guide](Media-Archival-Guide.md)




# Why a Naming Guide?


Due to ever growing format support and the agnostic, openly standardised methods, the ability to accurately handle, store, communicate and collaborate with sample data is key but also helps you the end user in the long run.

As such this naming guide has been expanded into a basic data management guide.

You can submit sample data in single folders/files or even in mass to the [The Internet Archive](https://archive.org/) with an account, or in single file format via [Telegram](https://t.me/decodeteam), there is also the [public shared drive](https://drive.google.com/drive/folders/1lzQWdFFfVclEQUDbuwngro0MCusOgPM6) that has TBs of example samples.


# The Key Simple Stuff


FLAC compressed files are preferred for archival, and long term storage with context provided in both the name and the extension, the decoders are RAW/FLAC file agnostic same with bit-depth so as long as the correct sample rate is known alongside the TV system you are good to go.

Image data of the physical cassette for easy high resolution scans of labels use a flatbed scanner at 1200dpi although 600dpi or a phone photo will work if that's all you have.

Notation of VCR/Player/Camera used and or original source of media generation if known this keeps track of what came from ware.

External `.txt` or `.md` or `PDF` for supporting documentation files are recommended.

Add VCR/Player/Camera used and or original source of media generation if known this keeps track of what came from ware.

!!! TIP
    Always backup your `JSON` files as that's your source metadata for any decoded data, and can be used to extract visual graphs or other key information later.

!!! TIP
    [Everything](https://www.voidtools.com/downloads/) & [WizzTree](https://diskanalyzer.com/) these 2 simple tools make life easier when doing mass file management for Windows users. 


## Checksums


The point of checksums today is to verify a clean file upload or download and backups are still clean, this is both a data corruption/manipulation detection system but an foundation for offline or archival storage systems, if you cant verify something is wrong early it could be too late to recover.

Key value in doing this is confirming data moved from HDD/SSD system to system and or burned to M-Disks for example is an exact copy without system or user errors in the process.

[RapidCRC](https://ov2.eu/programs/rapidcrc-unicode) / [TeraCopy](https://www.codesector.com/teracopy) - Windows GUI Tools

[GTKHash](https://github.com/tristanheaven/gtkhash) - Universal Platform GUI Tool

How this works is it computes a unique hash value for every single byte of data this looks like the following:

CRC: 

`2E462BD1`

SHA3-512:

`9C6269C2D26B37B6086CDFC443FA31B20FF9BF5D68A12299FB3E9A275FA36DC8D6CFD32ABCBBFD43C64DEA5947F8BD7E70C84420CDCA85AEEA56654B0202097C`

MD5 is small enough to embed into file names for quick check.

Sha3-512 can be easily stored as a file and within an documentation file for absolute check.

An combination of CRC/MD5 & Sha3-512 is recommended for data integrity validation although it should be noted CRC32 can be embedded into files stored on NTFS systems like what windows uses.

Although FLAC/RAW files have an degree of redundancy and the time base corrected files are header-less so a few bit flips wont destroy captures easily this process is more about ensuring the `.json` & supporting files remain in tact.


## Formatting Captures:


Both `-` and `_` are legal separator, spaces in file names is a hassle with Linux and UNIX systems so its best to avoid them all together on RF data as it avoids conflicts and allows copy pasting.

For sample sharing just add an username tag (typically discord etc) to the beginning of the name this way its easy to reference who added the sample.

**MediaName - MediaType - TV System - VCR_Name - Capture_Device - Gain - BitDepth - SampleRate**


Tape format should always stated in the file name if `.ldf`/`.flac`/`.s16`/`.u16`/`.u8` standard extensions are used.


#### Example 1: User Submission   

Harrypm-Dialog_2001-vhs-pal-DdD-gain-2.02-Panasonic_AG7150-2022-12-11_04-37-13.flac

#### Example 2:

Spiderman-vhs-ntsc-Panasonic_AG1980P-CX_Blue_Stock-gain22-cxadc-2022-12-11.vhs

#### Example 3:

vhs-test-pal-CX_White_Modified-Gain5-8-bit-20msps-2022-12-11.flac

#### Example 4:

EBU_Colourbars-vhs-pal-Panasonic_950B-16msps-8bit-2022-12-11.vhs


## CXADC Designators:


Stock CX Card captures can use the CXADC Designators.

These captures are in the `.u8` & `.u16` under standard use as they are in `unsinged` formatting.

`--cxadc`    28.6msps 8-bit  (8fsc) 

`--cxadc3`   35.8msps 8-bit  (10fsc) (Not recommended, as this just up-samples data)

`--10cxadc`  14.3msps 16-bit (4fsc) (Technically 4fsc NTSC*)

`--10cxadc3` 17.9msps 16-bit (5fsc) (Technically 4fsc PAL*)

For modifyed cystal cards and clockgen cards this can also be 20/40/50msps or even upto 57msps in some cases bare in mind.

!!! IMPORTANT
    28msps & 40msps modes are the recommended for CX Cards sub 20msps is never recommended for initial signal capture.

!!! CAUTION
    --10cxadc & --10cxadc3 does not meet current standards for VHS or higher grade format and can not be considered an archival grade capture if used to sample formats.


## DomesDay Duplicator (DdD) Designators


`.LDS` 40msps Non-Compressed

`.LDF` 40msps FLAC Compressed


## FLAC Compressed Naming Designator's


VHS    -  .vhs

S-VHS  -  .svhs

Umatic -  .umatic

Video8 -  .video8

Hi8  -  .hi8

βetaMax - .betamax

βetaCam - .betacam

Video2000 - .v2000


## Information Calculation


### Decode Runtime & Progress:


Frames: 63500

25 ÷ 63500 = 2,540 Seconds (TV System 25 PAL 29.97 NTSC)

2,540 ÷ 60 = 42.33 (Minutes.Seconds)


### Sample Calculation:


Seconds Times MSPS i.e 40/20/28 and so on.

Seconds: 1817

40 x 1817 = 72,680 * Samples


### Compression Ratio & Percentage Calculation:


158,209,146,880 Bytes - Uncompressed

52,103,563,068 Bytes - Compressed

19,237,694,012 Bytes - Re-sampled Compressed

For Ratio: Uncompressed Divided By Compressed

Ratio: 3.036436235148109

For Percentage: Uncompressed Divided By Compressed Times 100

Percentage: 303.6436235148109


# Formatting An Index File


Now you know how to get the basic information of your captures, you need some level of formatting this is a basic example used for home media archives going onto discs for archive.


# Index file example:


## Media Information:


(Append photos in DNG/JPEG if any of tape label/cassette)

Cassette: (S)VHS or (S)VHS-C (etc)

Condition: Clean, No mould, Shedding, Sticky (etc)

Tape Name: Title On Cassette (if any)

Tape Date or Year: 00.00.0000 DD.MM.YYYY

Tape Format: VHS / SVHS / Umatic / Video8 / Hi8 / βetaCam / βetaMax (etc)

Tape Speed: SP / LP / β I / β II (etc)

Tape System: NTSC / NTSC-J / SECAM / MUSECAM / PAL / PAL-M /

Tape Runtime: 00:00:00:00 (HH:MM:SS:FF Hours Minutes Seconds Frames)

Audio Modes: Linear / HiFi

Timecode: (VITC/LTC Yes/No/Both)

Head switch: Normal / Moved

(this is if you want the bottom lines recovered by moving the head switching position or ''the distorted line'' at the bottom of analogue tapes)


## RF Capture Information:


RF Video Start Point: (If multiple formats cut points should be noted due to decoders fixed format mode though this is only really an issue with VHS/S-VHS)

`-s 286`
`-s 5763`

RF Capture:
Tape-002-TP-DdD-Gain2.02_PAL_Cap1_2022-04-28_01-04-10.lds

Duration: (Total RF Capture Duration)
00:30:17 HH:MM:SS

Original: (Initial Capture Size)
88,514,560 KB

Compressed: (After Compression Size)
29,701,474 KB

Compression Ratio:
xxxxx

Resampled: (Size after 16~24msps 8-bit resampling)
9.902.103 KB


## Notes Section:


From simple to the smallest detail

Scratch, Label's Scanned (ref to scan data location)
Duplicate Made.

Chapter Notes:

HH:MM:SS:FF (Hours Minutes Seconds Frames)

02:34:12:03 Event Notation

If the decoded TBC/Video is included then you will want to include the version of vhs-decode/hifi-decode used to process it.

`git log` inside the vhs-decode directory and copy the last commit information.


# Page End 


Previous Page [RF Capture Guide](RF-Capture-Guide.md)

Sub-Page [Material Handling Guide](Material-Handling-Guide.md)

Next Page [Media Archival Guide](Media-Archival-Guide.md)