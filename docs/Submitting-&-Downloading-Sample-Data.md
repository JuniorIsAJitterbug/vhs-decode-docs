---
title: Submitting and Downloading Sample Data
---

## Data Repositories

[Sample Dump Telegram Channel](https://t.me/decodeteam)

[Google Shared Drive Public Samples Folder](https://drive.google.com/drive/u/1/folders/1lzQWdFFfVclEQUDbuwngro0MCusOgPM6)

[Decode Team - The Internet Archive](https://archive.org/details/@decode_team_fm_rf_archives)

[DomesDay86 Media - The Internet Archive](https://archive.org/details/@sinns86) / [GitHub Index](https://github.com/happycube/ld-decode/wiki/Disc-images-to-download)


## Sample Data Doc


There are no limits on length type or content type.

FLAC compressed captures are preferred due to ease of upload and download for those of less fortunate network abilities.

If possible include VCR/Player/Camera used and or original source of generation if known, feel free to create relevant documents separately in a txt file or md format for this purpose one per each media article, or spreadsheet format for larger file collections.


### Submitting Context


Please include your notes in a plain text `.txt` or markdown formatted `.md` file, google docs are also allowed but standard text data is preferred, due to ease of traslation & migration doing both or all 3 is fine.


### Naming Rules


Naming should be the following or similar to keep files orderly and easy to copy/paste and index.

Both `-` and `_` are legal separators, ware as `(` & `)` are illegal, so stick to the examples provided below.

Format: `Username_Media-Name-MediaType-TV_system-Capture_Type-Bit_Depth-SampleType`

Example 1:  `Harrypm_Colourbars_vhs_pal_CX-White-Stock_cxadc.betamax`

Example 2:  `Harrypm_Dialog2001_svhs_ntsc_CX-Blue-Stock_Gain-22_cxadc.u8`

Example 3:  `Harrypm_THX_ld_pal_CX-White-Modified_Gain-18_16bit-20mhz.u16`

Example 4:  `Harrypm_Test-43_vhs_pal_DdD_gain-8.5.ldf`

Example 4:  `Harrypm_Holiday_vhs_pal_DdD_gain-8.5_16mhz_8bit.vhs`

Tape format, bit depth and sample rate should always be stated unless  `.ldf`/`.u16`/`.u8` is used which implies the bit depth by its extension type.

Files with just `.flac`/`.oga` and so on should always have descriptive names. 


### Help


DomesDay Duplicator (DdD) Gain Config states.

|**Configuration**|**Switch Position**|**Gain**|
|-----------------|-------------------|--------|
| 15              | 1111              | 2.02   |
| 7               | 0111              | 2.17   |
| 11              | 1011              | 2.27   |
| 13              | 1101              | 2.45   |
| 3               | 0011              | 2.54   |
| 14              | 1110              | 2.59   |
| 5               | 0101              | 2.79   |
| 6               | 0110              | 3.02   |
| 9               | 1001              | 3.04   |
| 10              | 1010              | 3.34   |
| 1               | 0001              | 3.8    |
| 12              | 1100              | 4      |
| 2               | 0010              | 4.4    |
| 4               | 0100              | 6      |
| 8               | 1000              | 8.5    |


CXADC Bit depth/Sample rate Designators:

| Decoding Command  | Sample Rate             |
|-------------------|-------------------------|
| `--cxadc`         | 28.6 MHz/8-bit  (8fsc)  |
| `--cxadc3`        | 35.8 MHz/8-bit  (10fsc) |
| `--10cxadc`       | 14.3 MHz/16-bit (4fsc)  |
| `--10cxadc3`      | 17.9 MHz/16-bit (5fsc)  | 

*Note 35.8 MHz/8-bit is not recommended due to up-sampling, no benefits just wasted space.

Capture Formats

| Capture Format    | Extension            | Compression Type |
|-------------------|----------------------|------------------|
| DdD 10-bit Packed | .lds                 | 10-bit Packed    |
| DdD 16-bit Singed | .s16                 | 16-bit RAW       |
| DdD 16-bit FLAC   | .ldf                 | 16-bit FLAC      |
| CX Card 8-bit     | .u8                  | 8-bit RAW        |
| CX Card 16-bit    | .u16                 | 16-bit RAW       |


List of flac compressed naming designators:


| Format                | Compressed Extension | Compression Type | Channels |
|-----------------------|----------------------|------------------|----------|
| Composite             | .cvbs                | FLAC             | 1        |  
| VHS                   | .vhs                 | FLAC             | 1        |
| S-VHS                 | .svhs                | FLAC             | 1        |
| Video8                | .video8              | FLAC             | 1        |
| Umatic                | .umatic              | FLAC             | 1        |
| Umatic SP             | .bvu                 | FLAC             | 1        |
| Hi8                   | .hi8                 | FLAC             | 1        |
| BetaMax               | .betamax             | FLAC             | 1        |
| Video2000             | .v2000               | FLAC             | 1        |
| SMPTE 1” Type C       | .type-c              | FLAC             | 1        |
| SMPTE 1” Type B       | .type-b              | FLAC             | 1        |
| EIAJ                  | .eiaj                | FLAC             | 1        |
| BetaCam               | .betacam             | FLAC             | 2        |
| BetaCam SP            | .betacamsp           | FLAC             | 2        |

Always include the sample rate of a compressed capture if using the format extension naming method, i.g `20msps 10-bit`.

With Betacam, betacam-y and betacam-c has to be discriminated, unless you have both channels interleaved or somthing, betacam is still in alpha workflow wise, now that syncronised CXADC capture is viable.

With βetamax be sure to include if βI βII or βIII speed.

Etc more formats will be added as captures are obtained for testing.

Current FLAC compression standards are:

40msps 8-bit, 16-bit & 10-bit packed - Decodes automatically (DomesDayDuplicator Stock) (40mhz CX Card Crystal Mod) 

20msps 8-bit  - Requires `-f 20` (Down sampled File)

16msps 8-bit  - Requires `-f 16` (Down sampled File)

CXADC Sample Rates:

17.9msps 16-bit - Requires `--10cxadc3`

14.3msps 16-bit - Requires `--10cxadc`

20msps 16-bit - Requires `-f 20` (40mhz CX Card Crystal Mod) 

16msps 8-bit - Requires `-f 16`

FLAC Compression & Resampling Scripts

For DomesDayDuplicator captures (might need ./ in start of command)

Command: ld-compress your-capture-name

For CXADC captures there is a wiki doc with a list of pre-made commands 

Please visit Tony’s GNRC flowgraph wiki for re-sampling/conversion scripts

OGG is no longer critically needed for archives due to flac being updated. - September 2022


### Mass Archive Submissions


We all love large datasets for testing a good example of this is Itewreed’s RF Archive witch has 5.7 Terabytes (TB) of German off-air TV recordings.

Sadly however to changes in Google Workspace as of July 2023 we no longer can accept mass submissions to the google shared drive, we do accept physical submissions in LTO5/SSD/HDD/Optical with index files on the shared drive however, sadly due to the 5TB cap the public shared drive will be limited to 1-2TB of active data at any given time for the foreseeable future.


### Checksums


Checksums are recommended typically CRC & Sha3-512 for verifying data integrity are appreciated in separate files & index names alongside captures to verify a clean file upload/download and local transferring.

Example of a CRC checksum hash embedded: `Testbars-PAL-CXADC-[248955C9].svhs`

Example of a Sha3-512 checksum: `b984fa07139ddaf2a1c4b8c6b2a05ca5c4c0e1119616ce329bdb72916c86f107`

Easy to use GUI checksum tools RapidCRC (Windows) GTKHash (Windows & Linux) 

If making optical archives or using the `.ISO` format then look at [Dvdisaster](https://github.com/speed47/dvdisaster#readme) for embedding/creating ECC data and verifying discs.
