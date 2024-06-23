# Frequently Asked Questions & Answers

If any words or terms are confusing and or completely unknown to you read the above document first it covers all the little things and more.

In order to correctly understand this project you will need practical information for setup/usage and a little theory helps for correct handling, its generally no more than 1-2 hours of reading, 

If you know what you are looking for on the right-hand side, the dropdown tab of indexed pages will help you.

- [Acronyms Guide](https://github.com/oyvindln/vhs-decode/wiki/Acronyms-Guide) Covers virtually all basic information you should have a basic grasp on before getting into digitisation of analogue formats.

- [The Readme](https://github.com/oyvindln/vhs-decode#readme) The term RTFM does apply here as the readme has practical operation installation information.

- [The Visual Diagrams Page](https://github.com/oyvindln/vhs-decode/wiki/Diagram-Visuals) 
  There have been many documented workflows and processing chains at an overview level this is useful to reference if any part confuses you or you want an idea of how to build a workflow.

- [The Tap List](https://github.com/oyvindln/vhs-decode/wiki/004-The-Tap-List) & [VCR Reports](https://github.com/oyvindln/vhs-decode/wiki/VCR-reports) has a range of notes and high-resolution photos of Consumer/Prosumer/Professional VCR's of different tape formats that have been modified for daily RF capture usage.

- [Supported Tape Formats](https://github.com/oyvindln/vhs-decode/wiki/Tape-Format-Support-List) - Decoding supports more then just vhs! 


## Q: Does xyz deck matter?


FM RF capture is universal in terms of supported hardware!

VHS/SVHS/Video8/Hi8/Beta/ED-Beta/Umatic/EIAJ/SMPTE-C/SMPTE-B/LaserDisc etc practically it's all the same and the FM RF capture method is hardware agnostic.

Whether it's an NTSC/PAL/PAL-M/NTSC-J/SECAM/MESECAM tape this does not matter as long as the deck runs and picks up the signal.

For SVHS decks in NTSC land (USA/CA) It may be cheaper to import a PAL deck as the later 90's units support SECAM/NTSC (Thanks Linus...)

To see the VCR/VRT/Camcorders that have been RF Tapped see the [The Tap List Example VCRs](004-The-Tap-List).

Now the RF test points that we commonly tap for capture are universal for recording & playback adjustment for video on all video tape decks, regardless of the format/region of the medium making the RF Tap and capture method a drop-in upgrade for almost any video tape deck you can find.


## Q: Why FM RF capture and software decoding instead of normal video capture?


A: It's just better!

No, It's a little more advanced, yet very simple in practice.

What comes out of the VCR's normal video and audio connections Yellow RCA / S-Video etc in an absolute sense, it's whatever the digital chips handling the processing has interpreted the signal as, this digital processing then conversion back to baseband analogue for capture from an archival perspective this is a nightmare... sharpness, interference from off-spec components to over or under-filtering of colour, noise etc the list is as endless as the number of posts about ''best this'' and ''bad that'' for XYZ tape or VCR format.

**Instead of dealing with that mess, we skip past it all entirely so.**

[VHS-Decode-Workflow-16-by-9-Overview-Current.png](assets/images/graphics/VHS-Decode-Workflow-16-by-9-Overview-Current.png"){: style="width=800px"}

With VHS-Decode the saying ''we'll fix it in post'' has never been more true because just like RAW digital video we have full control over the processing of the media in both the analogue and digital domains and every year of updates and provide better gains later down the line.


## Q: How do I get started is there a quick setup guide?


We have a basic YouTube video!

[![Watch the video](http://img.youtube.com/vi/Xb128g617sg/hqdefault.jpg){: style="width:500px"}](http://www.youtube.com/watch?v=Xb128g617sg)


A: Yes we have a [Quick Setup Guide](https://github.com/oyvindln/vhs-decode/wiki/Quick-Setup-Guide), but most information in there own full scope pages.

The workflow of 1-2-3 docs is as follows:

[RF Capture Guide](RF-Capture-Guide) --> [FLAC Compression Guide](RF-Compression-&-Decompression-Guide) --> [Decoding Guide](RF-Capture-Decoding-Guide) --> [TBC-Video-Export](TBC-to-Video-Export-Guide) --> [Post Processing](Post-Processing-Guide) --> [Media Archival Guide](Media-Archival-Guide).

Each guide will have sub-pages or docs that expand on subjects relating to that part of the workflow.


## Q: How resource-intensive is software decoding?


[vhs-decode-usage-windows-2023.PNG](assets/images/Hardware/vhs-decode-usage-windows-2023.PNG)

Not much for the actual FM RF processing, and is running on Windows 10 any standard midrange desktop or laptop hardware from the last 10 years and processes at around 2~5fps.

On current Ryzen 9 7950x that's `14.9fps`, and `16fps` M2 Apple Macs using 16msps down-sampled captures that are FLAC compressed.

The Chroma-Decoder can run faster than real-time and use up to 35GB of ram if available, this is the heaviest processing task but it will be limited by system resources in terms of speed, this also limits scrubbing speed inside `ld-analyse`


## Q: Is this the best way to preserve analogue media?


A: Yes, this is the end of methods in real-world terms.

As the [FM RF](Signal-Sampling) method of direct capture preserves the original tape signals just after the initial tracking and amplification stage of your device, there is no alteration of content in any way, this detaches the medium from the fixed limits of video hardware & software capture solutions today.

Since RF signals are basically audio in terms of how software sees it with FLAC compression (a zip file basically) and even re-sampling in some cases a single Sony 128GB Blu-Ray disc can hold 6 hours of lossless analogue media signals and a copy of the tools to decode it, leveraging the full potential of today's tools and tomorrow's software advances.

Due to this process, there are fewer worries if there is tape shedding or handling damage happens afterwards if the FM RF data was fine on the first run it can be combined later, so keeping the original media is recommended, RF data is also headerless meaning very resilient to bit-flips and cosmic ray events even if not stored on solid optical archival mediums.

*Capture today, Decode forever!*


## Q How complex is using vhs-decode and its tool suite?


Setup normally takes under an hour for hardware and software.

- RF Tapping a deck normally takes 30min after finding your test points.

- Capturing an FM RF signal to file is just one click or command.

- Decoding FM to S-Video or Composite (.tbc) is just one command.

- Chroma decoding `.tbc` (4fsc data) files to normal YUV video is just one command.

ld-analyse is GUI based and all ld-tools are practically 1 single command for processing the TBC files.

Overall very simple operation of just change the input/output names on each capture/decode after your setup, `copy, paste, edit and run`. 


## Q: Is decode good for LP & EP tapes?


While SP will always have a better signal, decode supports LP & EP just as well as SP in VHS & SVHS.


## Q: Can I capture Super VHS (SVHS) tapes on a normal standard VHS deck?


A: It varies. If the deck supports SQPB you will be able to capture the full SVHS output since we are capturing at a stage before the signal gets modified to be decodable by the normal vhs circuitry. On newer (late 90s and on) VCRs it might work even if the deck does not support SQPB as most head amplifier/all in one chips had the support for adding SQPB by then even if the SQPB bits and SQPB mode weren't added the vcr.

The relevant part seems to be more whether the head amplifier supports and switches to SVHS/SQPB output mode, and the heads are up to the task which isn't really something that's possible to tell without trying to capture and decode unless the deck is a SVHS deck or a VHS deck with SQPB..

On non-SQPB decks, HiFi/Linear audio will work just fine but the video will have massive colour/signal drop issues on the normal video output.


## Q: What is a TBC? (Time Base Corrector) & What level of TBC can decode provide?


For those who know what a TBC is and or spent too much on one, It beats the FA-310P and TBC-1000/3000, DMR-ES10/15 handling LP and unstable media incredibly well.


| Out of sync Analog Frame | Time Base Corrected |
|--------------------------|---------------------|
| [frame_pal_source_176_family-cut-16msps-8bit.tbc.png](assets/images/example-media/Signal-&-Capture-Errors/frame_pal_source_176_family-cut-16msps-8bit.tbc.png){: style="width:1000px"} | [Signal-&-Capture-Errors/frame_pal_source_228_40msps-DdD-raw.tbc.png](assets/images/example-media/Signal-&-Capture-Errors/frame_pal_source_228_40msps-DdD-raw.tbc.png){: style="width:1000px"} |


A: Analogue video is like paper put through a shredder each frame is a bunch of lines of analogue image information, each rotation of the head a new line gets written or read, as such due to the mechanical nature and tolerance range these lines of information are almost never perfectly in sync on tape so a time base corrector looks at the signal and re-times the lines to be more even to each other.

VHS-Decode features the world's first software-defined digital TBC for analogue video media and its **100% free** and **100% open-source developed** jointly with the [ld-decode project](https://github.com/happycube/ld-decode/wiki).

Digital time base correctors typically feature manual but mostly hands-off automatic `video level`, `black level`, `chroma level` & `chroma phase` adjustment alongside `dropout compensation` based on reference RF input, the decoders provides its dropout detection data from the RAW RF during decoding with level control being fully adjustable in post.

`ld-dropout-correct` after decoding dropout corrects your decoded S-Video or CVBS type TBC files.

Note: VHS-Decode is not a frame-store. (Typically the TBC format can handle progressive frames also)

Automatic signal correction and drop-out detection are built into the decoding process alongside the hands-off TBC that applies to the entire signal a `full-frame TBC in simple conventional terms` with decoded information to a single Composite `.tbc` for composite modulated formats like Laserdisc/SMPTE-C or S-Video for Colour-Under formats like VHS/Beta etc which makes a separate `_chroma.tbc` allowing colour to be decoded separately and combined later to a [video file](https://github.com/oyvindln/vhs-decode/wiki/TBC-to-Video-Export-Guide).

The Time Base Corrected format (TBC) supports stacking, dropout correction, and fixed framerate output after initial decoding and signal correction processing, via `ld-dropout-correct` or even Avisynth manually.


## What is 25i & 29.97i?


[TV_Systems_of_The_World.png](assets/images/graphics/TV_Systems_of_The_World.png){: style="width:500px"}

The framerate in SD video is commonly miss-represented such as 30i and 60i so we use accurate `frames interlaced` common broadcast wording and the formats and framerates are different between regions.

| TV System    | Frame Rate | Field Rate |
|--------------|------------|------------|
| PAL / SECAM  | 25i        | 50         |
| NTSC         | 29.97i     | 59.94      |

Frames are interlaced into 2 fields for each frame this is why when [de-interlacing](Deinterlacing) it ends up as 50p & 59.94p as that is motion accurate, although for Anime/Telecine Films which is mastered at 24fps these frames are recovered via pull-down de-interlacing.

60p & 60i does not exist, in modern analogue and modern broadcast this is true, but pre-colour era media did have these integer values but is rare to encounter such media today.

Analog tape is always Interlaced, in Top Field First, 

Digital tape can have progressive but interlacing is almost always Bottom Field First.


## Q: Why does the colour sometimes look weird in ld-analyse?


As [ld-analyse](https://github.com/oyvindln/vhs-decode/wiki/ld-analyse-User-Guide) reads the `.tbc` & `_chroma.tbc` files and combines them together in Realtime with the `ld-chroma-decoder` to the same effect as [SOX combining commands](https://github.com/oyvindln/vhs-decode/wiki/ld-analyse-User-Guide#y--c-combining-with-sox) so consider it semi **experimental** but good enough for inspecting and adjusting for export.

You can also change what real-time decoder is used for colour under `Window --> Chroma Decoder Configuration`.

To see actual quality output make a short 500 frame video export with the following command:

    tbc-video-export -l 500 input.tbc


## Q: What are the costs?


A: It costs 60-300USD* depending on the level of setup you wish to invest in and what hardware & tools you already have available.

The [white PCIe 1x CX Cards](https://github.com/oyvindln/vhs-decode/wiki/CX-Cards) are 20-35USD per card and basic tools/cabling and even [amplifiers](https://github.com/oyvindln/vhs-decode/wiki/CX-Cards#external-amplification) is 25-100USD depending on how budget restrictive you need to be or if you preferer to get tooling and make cables from the ground up etc but a duel card setup with external clock should be no more then 100USD total from AliExpress in 2023.

The [DomesDayDuplicator (DdD)](https://github.com/happycube/ld-decode/wiki/Domesday-Duplicator) can cost upto 350USD* each ware as China has 1000's of CX Cards and amplifier boards available for order so if you already have a VCR/Desktop you are just 2 steps away, but if your a laptop user then the DdD + a [RTLSDR](https://github.com/oyvindln/vhs-decode/wiki/RTLSDR) is your best option if you don't want to get a 40-60USD Desktop to do captures on.

But its always looking at [RF Hardware Guide](https://github.com/oyvindln/vhs-decode/wiki/RF-Capture-Hardware) for new and exciting hardware options!


## Q: Do I need a normal capture card or a conventional setup?


Yes, some basic capture setup such as a GV-USB2 / DMR-ES10 + BlackMagic SDI etc is recommend, alongside a modern TV or CRT for live monitoring if you already have a basic or easycrap setup its good enough just to get you reference runtime & audio sync from the deck.

SDI or AIO IC based capture devices are recommended as they keep audio/video in sync.

If you can get your hands on a CRT, especially something like a Sony PVM or JVC equivalent it will make your life easier to check for VBI area data, and adjusting of tracking on a VCR/VTR.

But any basic TV/CRT would allow you to visually adjust the tracking to a acceptable level as well using playback then slow advance or pause + fast forward etc to check if the tape is properly tensioned.


## Q: What about Audio Capture?


[Audio Wiki Page](003-Audio)

There is 3 types of audio on tape, `Linear`, `HiFi FM` & `PCM Digital`

The RCA or Balanced XLR outputs on decks are always `Baseband` ready for speaker use or digitation.

PCM digital is mainly found on Hi8 and rare SVHS tapes, and there is a few flavours of studio PCM that used video frames for data.

Video8/Hi8 HiFi is always captured on its 1 RF point alongside video/timecode on different carriers, with PCM being lossless via FireWire DV25 reference capture alongside ideally a S-Video reference capture as DV25 is too compressed for SD video.

(S)VHS/Beta has 2 separate signals one for Video and one for HiFi audio if your tapes only have Linear then you will need to conventionally capture the audio regardless, this is why reference conventional captures are recommended during your RF capture to save on tape re-runs and give you a reference to correct for audio drift, is becoming non-critical when synchronised setups are used such as [Clockgen Mod](CX-Cards) or the [MISRC](MISRC).


## Linear Audio


SMPTE-C, SMPTE-B, EIAJ alongside Beta/VHS first gen decks are Linear Audio only. (Low end 80s for VHS etc)

For Linear Capture we now recommend [Clockgen Mod](CX-Cards) which has 2 audio channel inputs using a standard 96khz ADC, allowing truly hardware synchronised Linear/HiFi/Video signals off the same clock source.

If your not using that then a modern reference capture workflow from an SDI or GV-USB2 chain is acceptable, linear does not have a higher dynmic range then any 16/24-bit audio ADC chip can do today.

You can also use line inputs or desktop interfaces, this capture method tops out practically speaking at current 32-bit float recorders and desktop interfaces i.g Zoom or SoundDevices units.

48khz 24-bit is the practical minimum for sampling for 90% of linear tape formats, ensuring solder joints on the decks and using properly made cables, alongside keeping your linear heads as clean as possible, is all you can do to affect quality of a linear baseband capture.

(Fun fact Linear magnetic is also common on Super8/Standard8 film formats, ware as 16/35mm has had digital optical since the 1980s)


## HiFi Audio


[HiFi-Decode](HiFi-Decode) & [RTL-SDR Decode](RTLSDR)

HiFi FM audio capture is just as easy as video it's just another tap point, thanks to the low cost RTL-SDR units HiFi tracking adjustment and real-time decoding, alongside capture is very easy to get into, where as full HiFi-Decode offers a greater level of processing as along as the HiFi signal was tracked properly.

However, some decks are better than others, though this is a limit of current software processing not all VCRs have HiFi test points ones with last gen ICs for example, and the AG7000/5000 line of VCRs have a filter on the left channel of which is yet to be compensated for in software, meaning baseband capture is the only viable option on these decks, as such 90s prosumer decks from Sony/Panasonic are more so ideal for VHS.


## Q: Do I need a separate device for HiFi? 


You will need 2 ADC channels for VHS/Beta 2 devices [Hardware Device Options List](https://github.com/oyvindln/vhs-decode/wiki/RF-Capture-Hardware).

You have 6 setup options, `DdD + RTLSDR`, `CX Card + RTLSDR`, `CX Card + CX Card`, `2x CX Card + Clockgen Mod`, `MIRSC + Audio ADC` & `MISRC with intergrated Audio`

We now recommend for people starting or just want to tinker at a low cost [2x CX Card + Clockgen Mod](CX-Cards) as it makes post syncing much easier, but an RTLSDR is a very useful tool for testing & adjusting HiFi tracking so its worth getting if possible.


## Q: Does VHS-Decode output a better picture than something like a Panasonic AG-1980P/NV-HS950B with its TBC/DNR for example?


A: It does everything broadcast and consumer TBCs like the FA-310P and TBC-3000 can do and more down to frame or even RF sample-level control as its entirely processed after the fact every single frame could be decoded differently if absolutely needed the best example of this is the `--recheck_phase` & `--chroma_trap` commands that correct video colour phase on every single frame and filters the colour signal out of the luminance one producing a cleaner picture.

| NV-HS950B Internal TBC - Conventional | NV-HS950B Decoded RF from ENV Point - VHS-Decode |
|------------------------|-------------------------------------|
| [Wedding-VHS-ADV-BlackMagic-NV-HS-950B-PAL.jpg](assets/images/example-media/Wedding-1999/Wedding-VHS-ADV-BlackMagic-NV-HS-950B-PAL.jpg){: style="width:800px"} | [Wedding-VHS-DdD-Decode-NV-HS-950B-PAL.jpg](assets/images/example-media/Wedding-1999/Wedding-VHS-DdD-Decode-NV-HS-950B-PAL.jpg){: style="width:840px"} |
> 2021 Example

S-Video to Blackmagic Analogue to SDI (*ADV7842 Based Unit*) V210 10-bit (720x576)

VHS-Decode --> Chroma-Decoder transform2d --> FFV1 10-bit (928x576)

As it's not baked-in like a video file you're not stuck with a fixed quality level or fixed processing just the potential of the media format itself, saving valuable head & tape life and your time.

You can re-decode until perfectly adjusted and encode the decoded output to adjusted video files without even touching a video editor if you so wished.


## Q: I have hard white lines in my decodes what are these?


### [Visual Guide To Video Errors](https://github.com/oyvindln/vhs-decode/wiki/Video-Signal-Errors)

This could be several things:

01. **Loss of Tracking**

Solution: Visually adjust tracking and re-capture.

02. **Weak RF Signal Output**

Solution: Try increasing the gain or add a 10-100uf 16v electrolytic or polymer capacitor to the RF test point before cabling, positive leg on test point negative on cable and or an amplifier.

03. **Hard Dropouts** (large white lines across the whole frame)

Solution: Tapes can have a magnetic loss, shedding or clogged heads if the latter then cleaning is all you can do alongside stitching captures and or stacking them after the fact.

04. White lines at the exact position every few seconds on a known good tape?

Solution: VCR solder joints can weaken over time this is called a "dry joint" check your head-amp/head-drum and put some flux on the solder joints and reflow them for 2-3 seconds with a conical tip on a soldering iron at 340°C then clean them with rubbing alcohol.


## Q: I have issues with RF captures with a monitor connected?


A: It's pulling too much signal, either add a capacitor 10uf to 100uf 16v in-line with your RF tap point is common practice or just disconnect all but the RF capture hardware.


## Q: What about VITC Timecode, Closed-Captions & Teletext?


Under the "VBI Data Extraction & Decoding" tab there is several pages dedicated to this including a [Visual VBI Guide](https://github.com/oyvindln/vhs-decode/wiki/Identifying-vbi-data) showing all the types.

[Ebay-NV-S7-VHS-SP-Full-Frame-Interlaced-25i.mkv_snapshot_00.00.000.jpg](assets/images/VITC/Ebay-NV-S7-VHS-SP-Full-Frame-Interlaced-25i.mkv_snapshot_00.00.000.jpg)

A: If the signal portion is intact, almost any data in the vertical blanking area (VBI) can be inspected via `ld-analyse` and extracted with `ld-process-vbi` after decoding like this [VITC Timecode](https://github.com/oyvindln/vhs-decode/wiki/VITC-SMPTE-Timecode) shown above. 

You can also manually use the full signal 1135x625 PAL & 910x525 NTSC `.tbc` (not the _chroma.tbc) [with FFmpeg](https://github.com/oyvindln/vhs-decode/wiki/Command-List#ffmpeg-quick-export-luma-bw-ffv1-mkv) as its just standard `GREY16` raw video data.


## Q: Why does decode only run at 2-14.9fps on x86 hardware and 7-16fps on an M1 Max and M2 Apple Silicone


A: CPU & Cache speed are the main bias in terms of frame processing speed, the vbi processing and chroma decoder can run in real-time but the de-modulation and time base correction phase is limited due to a lack of multi-threading.

However, this does not stop you from running multiple decodes at separate points on the RF capture, and then stitching the video files afterwards, if you have a Threadripper or Xeon server this option may interest you however we do not have scripted tools to automate this yet.


## Q: Will VHS-Decode ever be real-time?


The software is nowhere near-complete nor extremely optimised for multi-threading past 6 threads, but at the current development pace and state the decoder with 3-6 years newer hardware will be able to do ''brute force'' faster then real-time, if GPU support is implemented than faster then real-time would be easy today.

Chroma-decoding i.e converting the S-Video/Composite signal in a TBC file to YUV video streams or encoding them to files is already realtime on most modern CPUs.


## Q: Why is my expensive JVC Prosumer VCR so low signal?


A: As JVC prosumer to rackmount decks generally don't apply much amplification on their head amplifier stage, this results in a lower level of signal output compared to Panasonic/Samsung decks on their respective standard test points.

They may be fancy for standard playback but in reality, not the best option between inflated prices and the requirement to add amplifiers on each test point to achieve an optimal signal for capture.


## Q: Can this be used on Windows & Mac systems? 


Yes we have full decoding & media export support for Linux/Windows/MacOS.

[Windows Builds](https://github.com/oyvindln/vhs-decode/wiki/Windows-Build) / [MacOS Builds](https://github.com/oyvindln/vhs-decode/wiki/MacOS-Build) 

Capture on windows is limited to the DomesDayDuplicator and other USB/TB based SDR units unless you install a Live Linux Install on a USB drive to use the CX Cards & the CXADC driver with a windows desktop or have a full separate install.

MacOS is limited to DomesDayDuplicator or other SDR units.


## Q: Can I playback my tbc files a TV or CRT?


A: Yes using an Analogue to Digital converter (DAC) just like audio files to headphones/speakers.

Using the FL2K VGA adapters (10USD+-) and breakout cables we have achieved this for more information read [TBC-Analogue page](https://github.com/oyvindln/vhs-decode/wiki/TBC-To-Analogue).

You can also create TBC files with the [chroma-encoder](https://github.com/happycube/ld-decode/wiki/ld-chroma-encoder) from the ld-tools suite which will take raw RGB or YCbCr encoded video files and make a single Composite or S-Video separated file.


## Q: How does decode compare to Cube-Tec & The Quadriga system?


While we do share the same concept and basic scope of abilities it ends past the RF Tap point.

Quadriga: FM RF Taps --> Custom Amplifier Boards --> Proprietary RF Capture & FPGA Processing boards --> Digital Files.

VHS-Decode: FM RF Taps --> Open-Source Amplifier Boards --> Open-Source RF Capture via any generic ADC/SDR system to Digital files --> Open-Source Software Video & Audio Processing --> Digital Files.

Thanks to the [External Clock CX Card Mod](CX-Cards) we now can say we surpass there "RF Direct Trasfer" offerings.

The suite of decoders is built and tested to run on standard computer hardware and is entirely open-source, so it can be ported to anything, ware as Quadriga uses an entirely closed-source code base physically running on a Xilinx FFPGA, while it does have a lot of benefits like real-time RF processing, any real world debate or comparison to the decode projects is academic as consumers cant even obtain the hardware in the first place.


## Q: What's the catch?


Welcome to the digital era.

The final and ongoing cost will be data storage, which is relative to the amount of media, so if you know how long your media runs for you can get a comprehensive cost calculation + 10-20% for overhead, with current standards expect around:

- `RAW FM RF 625MB~4.5GB per minute of real-time capture space`. (Dependent on capture device & sample rate used*)

- `FLAC Compressed RF 325MB-600MB per minute of permanent space`. (Based 16msps 8-bit to 40msps 16-bit range*)

Compressed raw data rates is dependent on if the tape is modulated composite like SMPTE Type-C, LaserDisc or colour-under like VHS, Umatic, Beta formats more actual video signal information means more data to store. 

- `.tbc` PAL being `2.1GB/min CVBS` & `4.2GB/min S-Video` (126GB/hour & 252GB/hour)

- `.tbc` NTSC being `1.7GB/min CVBS` & `3.4GB/min S-Video` (102GB/hour & 204GB/hour)

- `.mkv` FFV1 10-bit video files are around 70-80mbps 700/800MB per minute.

- `.mkv` FFV1 8-bit video files are around 45-50mbps 450/500MB per minute.

The decoded TBC files can be deleted after decoding, but always note the command/version used to decode allowing you to 100% recreate those TBC files later if need be, the `JSON` file is automatically embedded into video files when exported via `tbc-video-export` and don't forget to run `ld-process-vbi` and or `vhs-teletext` on your TBC files if there is [Any VBI data](https://github.com/oyvindln/vhs-decode/wiki/Identifying-vbi-data) wise.


## Q: What's the Storage Costs & Compression rates?


If you have a lot of tapes over 100+ hours worth, an 2-4TB M.2 NVME drive is ideal for capture and compressing and an 8-22TB (WD/Seagate Sucked Drives are a cheep and good option) for working space is recommended as this gives enough space to work on 2 full 90min tapes at the same time or capture and compress a single 6-hour tape and or decode it to the HDD if there is not enough SSD space.
 
`Saving only the FM RF data is actually more practical than video` considering the decoders and their dependencies are all under 1GB of data and can be expanded on or edited via human or AI programming tools in the future, but are also available in self contained binary's today, you are better off focusing on archiving the compressed FM RF captures to archival grade optical discs such as M-Disc, DM Archive, DataLifePlus Blu-Ray media they all use use the universal disk format (UDF) and have a real-world archive life of 100+ years in a 15-35°C environment you can read more into it on the [Media Archival Guide](Media-Archival-Guide).


### Compressed Captures Sizes & Quality


FLAC Compression alongside resampling has been employed for space saving.

54msps 8-bit Compared to Resampled 16msps 8-bit (NTSC VHS) for example has a negligible visible difference unperceivable in motion only distinguishable on a modern display imperceivably level of difference on a CRT display for example.

Important: This is for VHS, 16msps won't be enough bandwidth for most other formats, with 20msps 8-bit being the safe capture rate for standard VHS.

[Imgsli Slider Comparison](https://imgsli.com/MTQ5ODI1)

16msps 8-bit with FLAC compression for **VHS NTSC**

| Runtime | File Size |             Storage Medium Note             |
|---------|-----------|---------------------------------------------|
| 45min   |  15 GB    |                                             |
| 60min   |  19.44GB  |                                             |
| 75min   |  24.30GB  | 25GB M-Disk/GlassMasterDisc                 |
| 90min   |  29.16GB  | S-VHS/VHS-C tape max                        |
| 120min  |  38.88GB  |                                             |
| 150min  |  48.6GB   | 50GB M-Disk / 50GB GlassMasterDisc Max      |
| 3-hour  |  58.32GB  | VHS SP Max                                  |
| 240min  |  77.76GB  |                                             |
| 5-hour  |  97.2GB   | 100GB M-Disk Max                            |
| 6-hour  |  116.64GB | 128GB Sony Quad Layer BDXL Max / VHS LP Max |

!!! NOTE
    RF Capture is always variable data rate once compressed, only raw samples are near absolute in terms of file size.

A standard BD-R 25GB M-Disk for example costs around 5USD cost (25USD per 5 pack) 25-30USD for a 100GB single disc and 80-100USD for a 5 pack of 100GB discs.

8TB 3.5inch drives costing only 90-130USD a unit for server-grade or NAS-grade drives. (SAS drives can be had even cheaper at the cost of SAS controllers prices are based off SATA drives)

BD/BDXL burners are only 45-80USD (all made after 2014 practically support M-Disk Blu-Ray)


## Why do most videos of VHS and other analogue footage look terrible on YouTube?


`Black Bias Macroblock Encoding`, as you will notice darker colours will be more blocky and "crunched" by compression artefacts.

But in the 4k to 8k brackets the bitrate is higher and macroblocks are much harder to see outside of pure black images, so videos are best upscaled to 2160p or "4k" bracket i.g `2880x2176` after being QTGMC de-interlaced or IVTC if 24p media and here is some example settings with `spline16` upscaling and QTGMC configured to `SourceMatch=3, Lossless=2, Sharpness=0.3, TR2=2`.


## Page End


