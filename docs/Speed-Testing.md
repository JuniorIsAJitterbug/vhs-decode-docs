# Processing Speed Testing Guide 

This guide is for testing processing speed on hardware configurations with new or old code in the vhs/ld/cvbs decode suits. 

`hifi-decode` is excluded due to faster than real-time being possible with 1-10msps sampling.


## Current Records 


7.95 fps - Ryzen 9 7950x (x86) DDR5-4400 128GB config using `super-mario-all-stars-video-pal-crosshatch-sample-1m.flac.ldf`

14.9FPS - Ryzen 9 7950x (x86) DDR5-4400 128GB config using `16msps 09_wnbc_friends_1997` with `--no_resample`

16fps   - Apple M2 Mac Mini 16GB DDR5 config using `16msps 09_wnbc_friends_1997`

8fps    - Apple M2 Mac Mini 16GB DDR5 config using `Wrapscallion_SMPTEbars_VHS_NTSC_SVO-5800_DdD_gain8.5.ldf` with `vhs-decode -l 500 --level_detect_divisor 6 --no_resample --use_saved_levels --threads 8`


## Logging Commands & Info 

The `time` command can give you read-out statistics like this

    real    154m30.056s
    user    0m0.736s
    sys     0m1.886s

## You need to provide

The above results corresponding to the test samples below (or any from the [shared drive](https://drive.google.com/drive/folders/1lzQWdFFfVclEQUDbuwngro0MCusOgPM6?usp=share_link) so it's easily replicable)

Include what your install is running on bare metal Linux, in WSL2/VMware/VirtualBox on Windows and of course Qemu or Parallels Desktop on MacOS for example.

If your running a compiled version native then this needs to be noted.

As always please get your current builds' commit information, and date/time in dd.mm.yyyy formatting. 

CPU/GPU (Make Model & Cooling Solution)

Memory (Amount. Speed and if it's in single, dual or quad channel mode)

Storage (HDD, SATA SSD, NVME SSD etc make model)

If the captures are decoded/encoded to or from SSD/HDD etc ideally always on the fastest drive available.

## Commands of Intrest 

`--threads` 

While the decoder can only fully use around 4~8 threads this is also a factor dependent on cache and raw single-core speed.

`--no_resample`

Decodes Input at natively defined sample rate i.g `16msps` or `28msps`

`--use_saved_levels`

This skips doing most of the level detect code on each frame and only does it at the start or if there are issues detecting syncs. Provides a speedup in decoding and seems to work okay on captures that only have one single recording of media.

`--level_detect_divisor`

(Default 2) Experimental (May lower processing time)

`1`-`6` value, 1 every sample, 2 every other sample and so on, Changes vsync serration code only use every nth sample when determining sync/blank levels higher value lower accuracy.

`--recheck_phase`

Checks chroma phase on each field this can slow performance for colour correctness between multiple tape segments. 

`--ct` 

Enables Chroma Trap Intended to reduce chroma interference on the main luma signal, Recommended to use if seeing banding or checkerboarding on the main luma .tbc in ld-analyse.

## Testing Length 

`-l 500` 500 Frames

## Files To Test 

You can pull these files with `gdown` if you like via the links (Note these may pull entire folders with decoded data too)

### NTSC 

[40msps SMPTE Bars](https://drive.google.com/drive/folders/1sJ0BexVDHAnXSbuJF3-cws1x0tAmxoiE?usp=share_link) (30sec) (.ldf) (FLAC)

[40msps Nentendo](https://drive.google.com/drive/folders/1cDSqBuzBN2LUfstNKLCz95O-iSMqUHLd?usp=sharing)

[16msps 09_wnbc_friends_1997](https://drive.google.com/file/d/1IQglz-azRjkgmYmbCzTl7zux4wfZjJbO/view?usp=sharing)

[17.6msps](https://drive.google.com/file/d/1JXc6MCFC4cGsXwuUxnHqNDSMlJHnadoy/view?usp=share_link)

## PAL 

[40msps Eden Project](https://drive.google.com/file/d/1N8ySlx526wXihG-TrYjiCS6XDPL7aXxO/view?usp=share_link)

[40msps Munday Walking Around](https://drive.google.com/open?id=1jCByYDcpWy-SqNZgBWxSmhWyVw30T90o&authuser=harry%40opcomedia.com&usp=drive_fs) (30sec) (.lds & .ldf) (FLAC)

[16msps Itewreed Tape 158](https://drive.google.com/file/d/1yid6udtcT5HbR0KyabzHqQU0UVxS-KJH/view?usp=sharing)

## Example Commands 

Add `-f` followed by sample rate and `-n` for NTSC and `-p` for PAL

While `--debug` gives a lot more readout information it can cause a drastic slowdown although realistically you always want that extra log information for sanity and testing checks.

As fast as possible (with 16msps raw or FLAC compressed)

`vhs-decode -l 500 --level_detect_divisor 6 --no_resample --use_saved_levels --threads 8`

As accurate as possible 

`vhs-decode -l 500 --ct --level_detect_divisor 1 --no_resample --recheck_phase --threads 8`

## Pulling Test Data Down Via CLI

https://stackoverflow.com/questions/25010369/wget-curl-large-file-from-google-drive


## Submitting Test Data

* Via Email: harry@opcomedia.com 
* Via Document: In the [Testing Data folder](https://drive.google.com/drive/folders/18f6s5TvRjkrT_ai_oSQHpYAK_T7FghYa) (In Word/Excel or Docs/Sheets even Plain TXT/PDF) 