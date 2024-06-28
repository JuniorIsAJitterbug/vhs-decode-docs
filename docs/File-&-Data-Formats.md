---
title: File & Data Formats
---

## RF Capture Formats


CXADC 16-bit Unsigned

CXADC 08-bit Unsigned

DdD   10-bit Packed (10-bit unsigned integers)

DdD   16-bit Signed

MISRC 32-bit word file (2x 40msps 12-bit channels + 8-bit aux interleaved)


## Context of Extension Formats


`.bin`      - MISRC RAW 32-bit interleaved word file (extracted to s16 signed or u16 unsigned)

`.lds`      - DDD 10-bit Packed or 16-bit Signed 40msps

`.ldf`      - FLAC Compressed 16-bit 40msps (DomesDayDuplicator)

`.cds`      - 10-bit Packed 10msps (4:1 decimation mode)

`.s16`      - Uncompressed Signed 16-bit (40msps DomesDayDuplicator)

`.u8/.r8 `  - CXADC 08-bit Unsigned

`.u16.r16`  - CXADC 16-bit Unsigned

`.vhs`      - FLAC Compressed VHS    8-bit or 16-bit

`.svhs`     - FLAC Compressed S-VHS  8-bit or 16-bit

`.cvbs`     - FLAC Compressed CVBS   8-bit or 16-bit

`.flac`/`.wav`/`.raw` can also be used but would need file name context.

`.json`     - JSON metadata containing all information about its relating tbc files. (critical file)

The decoders accepts RF data in 10-bit packed 8-bit raw and 16-bit raw sample formats and FLAC compressed bit depth is automatic.

Decoders internal sample rate is 40msps by default, anything different has to be manually defined via `-f 20`/`-f 16` for 20/16msps for example.

Archives have been standardised to native capture rate + FLAC compression, although some formats can be down sampled in sample rate and bit depth.

VHS and Video8 NTSC can be compressed down lower then 325MB/min with with 16msps 6-bit down sampling in the FLAC codec for example.


## TBC Data Output Formats


`filename.tbc`        - Luminance Image Data (Full Composite if `cvbs-decode`/`ld-decode`)

`filename_chroma.tbc` - Chrominance Image Data

`filename.tbc.json`   - Frame Descriptor Table (Resolution/Dropouts/SNR/Frames/VITC Timecode/Closed Captions)

`filename.log`        - Timecode Indexed Action/Output Log


## The TBC Format


TBC Acronym, Time Base Corrected .TBC is a lossless digital file format containing time base corrected digitized composite signal.

A TBC retimes a video signal to make video lines (like a shredded piece of paper) more accurately the same length when displayed i.e correcting the time base of each line/field this fixes wobbly or skewed images as observed on lower-quality and or out of calibration VCRs the lines vary in length across the picture.

The software decoders are <u>not a frame store</u> so what you get is what you get, fully dropped frames of signal data just don't exist.

In a stable tape workflow a TBC acts as a buffer and conforms signal output to a stable legal output, that's acceptable for use with broadcast equipment and do dropout correction based off RF signal level drops.

<u>Drop out detection is done during decoding</u>, however it does gather data for doing that afterwards with the chroma-decoder and is <u>enabled by default</u>.

The time base corrected file or files are created directly after the signal de-modulation & filtering.

Decoding takes the 2 channels chrominance and luminance (C & Y) and creates separate TBC files for each respectively this allows for very clinical post adjustments and the ability to remove Croma entirely if unstable and or source is black and white media for example.

Originally developed for LD-Decode, the TBC format contains the full time base corrected [4fsc](Signal-Sampling.md) video signal in the digital component space using standard 16-bit unsigned greyscale values or `GREY16`, however the chrominance (colour data) and luminance (image data) are separated for tape decoding as these are separated signals on the [colour-under-tape formats] this allows more post decoding control with the gen chroma scripts that interact with the chroma decoder to combine the two TBC files in real time for FFMPEG to take and encode to a normal video file.


## The JSON Metadata Format


Please read the [JSON Metadata Format](JSON-Metadata-format.md) doc for full information about the metadata pipeline.

Tape format is determined by input format.

VITC/Closed Captions are decoded with `ld-process-vbi` and test signal readout and white SNR is obtained with `ld-process-vits` (if VITS is present)



## Technical Data Stream Information


The format is a stream of 16-bit unsigned values; each value representing a single 8-bit grey-scale value in a header-less data file.

The 16-bit greyscale values `GREY16` used by the output format are scaled representations of the standard 8-bit digital component values i.e. an 8-bit right shift of the value will provide the standard 8-bit digital component intensity values.

So you end with a composite 4fsc "full-frame" digital video file of the video signal.

1135x625 For PAL (17727262 Hz) (25i) (560mbps) (4.2GB/min) (252GB/hour)

910x525 For NTSC (14318181 Hz) (29.97i) (453mbps) (3.4GB/min) (204GB/hour)

Sample rate is always 4fsc, it's just stored a little weird in the .tbc for convenience: a 526th empty line in NTSC and a 626th line in PAL that has 4 samples - 2 from each field.

Note: Header-less data files are very resilient data i.e power loss or system issue and bit corruption will only damage or lose few pixels frames of information.

Digital TBC is an uncompressed 16-bit `GREY16` header-less video with the `.TBC` extension, with a `/JSON` descriptor file.

| TBC Variant | Frequency   | Bitrate    | Aspect Ratio | Total Lines (per frame) | Active Samples (per line) | Active Lines | Frame Rate | Field Rate |
| ------------|-------------|------------|--------------|-------------------------|---------------------------|--------------|------------|------------|
| NTSC        | 14318181 Hz | 453 Mbit/s | 4:3 or 16:9  | 525                     | 760                       | 488          | 29.97i     | 59.94      |
| PAL         | 17727262 Hz | 560 Mbit/s | 4:3 or 16:9  | 625                     | 928                       | 576          | 25i        | 50         |


Half lines don't *currently* exist in the TBC format, so there is padding effectively an extra dummy line included.

NTSC is 526 lines and PAL is 626.  

The extra 4 PAL samples (two from each field) would go on 626

These have to be removed to play the files back via ADC.


### Frame Sizes 


#### Full-Frame

1135x624 PAL

910x524 NTSC

#### Active Image Area (Default)


928x576 PAL SD

760x488 NTSC SD

#### Full Vertical (VBI Area)

928x624 PAL SD

760x528 NTSC SD

#### IMX D10 (+32 Lines)

720x608 PAL SD

720x512 NTSC SD


## TBC-Video-Export & Chroma-Decoder


The tbc-video-export.py and its exe version does several things, run the luma TBC though dropout compensation, combine Croma & Luma TBC's image data with FFmpeg with a filter complex and then pipes the merged image to encode a full-colour video stream, alongside embedding .json data, and setting timecode based off VITC if present.

Dropout correction/compensation can be done separately with `ld-disk-stack` and `median stack` via vapoursynth allowing for stacking to compensate for normal running operation dropouts.

To encode a black and white luminance only (greyscale) with video use the chroma decoder

`ld-chroma-decoder tapename.tbc y4m Output_Name.mov` (-p - PAL or -n for NTSC)

This gives you an uncompressed YUY 4:2:2 video file

`tbc-video-export tapename.tbc Output_Name`

This gives you a Lossless Compressed FFV1 YUY 4:2:2 encoded colour video file in the .mkv container.

Standard Active Area output is 70-100mbps

Full-Frame output is 100-130mbps

!!! NOTE
    The experimental full 1135x625 PAL 910x525 NTSC frame output currently has issues with frame order and it's a few pixels off, this will be improved in the future and is not currently enabled in the chroma-decoder.


## Generating Test Data


[Vapoursynth Colourbars](https://github.com/ifb/vapoursynth-colorbars)

[ld-chroma-encoder](ld-decode-tools.md)

[HackTV](https://github.com/fsphil/hacktv)
