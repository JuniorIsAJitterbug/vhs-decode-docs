# ld-tools is your video TBC handling toolset



## ld-process-vbi
This application examines the input TBC file and determines the available VBI data for each available frame.  The VBI data is stored as both the raw data value for the 3 VBI lines as well as a full decode of the VBI according to the IEC specifications.  The resulting information is written back into the JSON metadata file for the TBC output.

For NTSC sources this application also processes items from the IEC NTSC specification that are specific to NTSC LaserDiscs such as 40-bit FM codes, white flags, etc.

Syntax:

ld-process-vbi \<options> \<input TBC file name>

```
Options:
  -h, --help                Displays this help.
  -v, --version             Displays version information.
  -d, --debug               Show debug
  --input-json <filename>   Specify the input JSON file (default input.json)
  --output-json <filename>  Specify the output JSON file (default same as
                            input)
  -n, --nobackup            Do not create a backup of the input JSON metadata
  -t, --threads <number>    Specify the number of concurrent threads (default
                            is the number of logical CPUs)

Arguments:
  input                     Specify input TBC file
```


## ld-export-metadata
This application reads an ld-decode JSON metadata file, typically as produced by ld-process-vbi, and exports information in standard formats that other tools can read. At present, it can export:

- Per-frame signal quality information from the VITS test signals, as CSV
- Per-frame LaserDisc VBI control signals, as CSV
- LaserDisc navigation information, as FFMETADATA1 (which FFmpeg can use to add chapter navigation to a video file)

Syntax:

ld-export-metadata \<options> \<input>

```
Options:
  -h, --help           Displays this help.
  -v, --version        Displays version information.
  -d, --debug          Show debug
  -q, --quiet          Suppress info and warning messages
  --vits-csv <file>    Write VITS information as CSV
  --vbi-csv <file>     Write VBI information as CSV
  --ffmetadata <file>  Write navigation information as FFMETADATA1

Arguments:
  input                Specify input JSON file
```

## ld-dropout-correct
This application uses the drop-out information in the JSON metadata file to perform dropout correction on the input TBC file and produces a new output file.  The current version of the corrector uses framing in order to provide inter-field correction.  Note that inter-field correction may not function correctly for NTSC pull-down sources.

Syntax:

ld-dropout-correct \<options> \<input TBC file name> \<output TBC file name>

```
Options:
  -h, --help                Displays this help.
  -v, --version             Displays version information.
  -d, --debug               Show debug
  --input-json <filename>   Specify the input JSON file (default input.json)
  --output-json <filename>  Specify the output JSON file (default output.json)
  -r, --reverse             Reverse the field order to second/first (default
                            first/second)
  -o, --overcorrect         Over correct mode (use on heavily damaged sources)
  -i, --intra               Force intrafield correction (default interfield)
  -t, --threads <number>    Specify the number of concurrent threads (default
                            is the number of logical CPUs)

Arguments:
  input                     Specify input TBC file (- for piped input)
  output                    Specify output TBC file (omit or - for piped
                            output)
```


## ld-chroma-decoder
This application takes the PAL or NTSC TBC input video and performs chroma decoding (i.e colourises it).  Output is a sequence of RGB 16-16-16 video frames suitable for pipelining to an external application such as ffmpeg.

Syntax:

ld-chroma-decoder \<options> \<input TBC file name> (\<output RGB file name>)

The output RGB file name is optional.  If omitted the output will be sent to stdout (for pipe-lining).

Most of the options here correspond to settings in ld-analyse's 'Chroma decoder configuration' window, so you can experiment with them interactively using ld-analyse. For more information on what the settings mean, see the [ld-analyse User Guide](https://github.com/happycube/ld-decode/wiki/ld-analyse-User-Guide).

The `mono` filter isn't available in ld-analyse. It treats the whole signal as being luma, so it's the best choice when you know that the input video doesn't contain any colour information (e.g. black-and-white films).

```
Options:
  -h, --help                                  Displays this help.
  -v, --version                               Displays version information.
  -d, --debug                                 Show debug
  -q, --quiet                                 Suppress info and warning
                                              messages
  --input-json <filename>                     Specify the input JSON file
                                              (default input.json)
  -s, --start <number>                        Specify the start frame number
  -l, --length <number>                       Specify the length (number of
                                              frames to process)
  -r, --reverse                               Reverse the field order to
                                              second/first (default
                                              first/second)
  --chroma-gain <number>                      Gain factor applied to chroma
                                              components (default 1.0)
  --chroma-phase <number>                     Phase rotation applied to chroma
                                              components (degrees; default 0.0)
  -p, --output-format <output-format>         Output format (rgb, yuv, y4m;
                                              default rgb); RGB48, YUV444P16,
                                              GRAY16 pixel formats are supported
  -b, --blackandwhite                         Output in black and white
  --pad, --output-padding <number>            Pad the output frame to a
                                              multiple of this many pixels on
                                              both axes (1 means no padding,
                                              maximum is 32)
  -f, --decoder <decoder>                     Decoder to use (pal2d,
                                              transform2d, transform3d, ntsc1d,
                                              ntsc2d, ntsc3d, ntsc3dnoadapt,
                                              mono; default automatic)
  -t, --threads <number>                      Specify the number of concurrent
                                              threads (default number of logical
                                              CPUs)
  --ffll, --first_active_field_line <number>  The first visible line of a
                                              field. Range 1-259 for NTSC
                                              (default: 20), 2-308 for PAL
                                              (default: 22)
  --lfll, --last_active_field_line <number>   The last visible line of a field.
                                              Range 1-259 for NTSC (default:
                                              259), 2-308 for PAL (default: 308)
  --ffrl, --first_active_frame_line <number>  The first visible line of a
                                              frame. Range 1-525 for NTSC
                                              (default: 40), 1-620 for PAL
                                              (default: 44)
  --lfrl, --last_active_frame_line <number>   The last visible line of a frame.
                                              Range 1-525 for NTSC (default:
                                              525), 1-620 for PAL (default: 620)
  -o, --oftest                                NTSC: Overlay the adaptive filter
                                              map (only used for testing)
  --chroma-nr <number>                        NTSC: Chroma noise reduction
                                              level in dB (default 0.0)
  --luma-nr <number>                          Luma noise reduction level in dB
                                              (default 1.0)
  --simple-pal                                Transform: Use 1D UV filter
                                              (default 2D)
  --transform-mode <mode>                     Transform: Filter mode to use
                                              (level, threshold; default
                                              threshold)
  --transform-threshold <number>              Transform: Uniform similarity
                                              threshold in 'threshold' mode
                                              (default 0.4)
  --transform-thresholds <file>               Transform: File containing
                                              per-bin similarity thresholds in
                                              'threshold' mode
  --show-ffts                                 Transform: Overlay the input and
                                              output FFTs
  --ntsc-phase-comp                           Use NTSC QADM decoder taking
                                              burst phase into account (BETA)

Arguments:
  input                                       Specify input TBC file (- for
                                              piped input)
  output                                      Specify output file (omit or -
                                              for piped output)
```


## ld-analyse
This GUI application provides a range of features for examining TBC output including drop-out detection, video extent, line scope and VBI data.  The application works with NTSC and PAL TBC output files.

Note: The input file name is optional (you can either specify it from the command line or using the GUI once the application is running).

For more information about ld-analyse please see the [ld-analyse User Guide](https://github.com/happycube/ld-decode/wiki/ld-analyse-User-Guide)

Syntax:

ld-analyse \<options> \<input TBC file name>

```
Options:
  -h, --help     Displays this help.
  -v, --version  Displays version information.
  -d, --debug    Show debug

Arguments:
  input          Specify input TBC file
```

## ld-process-efm
This application processes the .efm output from ld-decode into either digital audio or data.  The application implements both audio and data error detection and correction.  Audio output is a stereo 44.1KHz 16-bit PCM file.  Note that this tool can be run as an interactive GUI or non-interactive via the CLI.  Many more decoding options are available in the GUI for more complex EFM processing.

Syntax:

ld-process-efm \<options> \<input EFM file name> (\<output PCM file name>)

```
Options:
  -h, --help            Displays this help.
  -v, --version         Displays version information.
  -d, --debug           Show debug
  -n, --noninteractive  Run in non-interactive mode

Arguments:
  input                 Specify input EFM file
  output                Specify output audio file
```

GUI options:
* Audio
  * Conceal corrupt audio data - Attempts to conceal corrupt audio data using the concealment type selected in the following section
  * Silence corrupt audio data - Silences any corrupt samples
  * Pass-through corrupt audio data - Passes any corrupt samples through to the output as-is
* Concealment type
  * Linear interpolation - Interpolates between last-good and next-good samples to conceal errors
  * Interpolated error prediction - Experimental (not recommended)
* Options
  * Pad start of audio from 00:00 to match initial disc time - Pads the start of the input sample to ensure the output starts from the 00:00 time of the disc.  Useful for assembling partial captures.
  * Decode F1 frames as audio - Always decode F1 frames as if they contain audio data (useful for older discs)
  * Decode F1 frames as data - Always decode F1 frames as if they contain data (useful for older IV discs)
  * Non-standard audio decode (no time-stamp information)
* Development
  * EFM to F3 Frame debug
  * F3 and section debug
  * F3 to F2 Frame decoding debug
  * F2 to F1 Frame decoding debug
  * F1 Frame to audio samples debug
  * F1 Frame to data sector debug

## ld-lds-converter
This application can accept 10-bit packed format .lds files and convert them to 16-bit signed files or vice-versa (useful for expanding .lds files and piping the output to a compression utility such as FLAC).

Syntax:

ld-lds-converter \<options>

```
Options:
  -h, --help           Displays this help.
  -v, --version        Displays version information.
  -d, --debug          Show debug
  -q, --quiet          Suppress info and warning messages
  -i, --input <file>   Specify input laserdisc sample file (default is stdin)
  -o, --output <file>  Specify output laserdisc sample file (default is stdout)
  -u, --unpack         Unpack 10-bit data into 16-bit (default)
  -p, --pack           Pack 16-bit data into 10-bit
  -r, --riff           Unpack 10-bit data into 16-bit with RIFF WAV headers
```

## ld-discmap
This application scans through the metadata for a .tbc file and attempts to correct metadata and video data to ensure the .tbc contains the correct amount of frames, in the right order, without duplication.  The application also pads the .tbc with dummy (black) frames when one or more frames are missing.

It is recommended to run ld-process-vbi on the input .tbc before running this tool.

```
Options:
  -h, --help     Displays this help.
  -v, --version  Displays version information.
  -d, --debug    Show debug
  -r, --reverse  Reverse the field order to second/first (default first/second)
  -m, --maponly  Only perform mapping, but do not save to target (for testing
                 purposes)

Arguments:
  input          Specify input TBC file
  output         Specify output TBC file
```

## ld-disc-stacker
This application performs 'stacking' of multiple versions of the same media ideally different copies with exact same mastered contents.

Disc stacking requires a minimum of two input sources in order to work although more = better so there is no limit.

Stacking is performed by taking all available input sources and, pixel by pixel, determining the number of available sources for the pixel (by removing outliers marked as dropouts in the source files).  If more than 3 sources are available for the pixel the tool will use the median value of the available sources as the output (when there are an even number available of pixel sources, the two centre values of the median are averaged to the output).  If only two sources are available an average is used.  If only one source is available it is passed directly as the output.

If no sources are available for a pixel the tool will attempt to use differential dropout detection (diffDOD) to recover a value (in the case where ld-decode marked the pixel as a false-negative) unless the --no-diffdod option is specified.

If the --passthrough option is specified the tool will, when all pixel sources are marked as a dropout, mark the resulting output pixel as a dropout (regardless of the diffDOD result).  The --passthrough is useful in non-preservation cases where it is desirable for master plate errors (which cause dropouts in the same place on all resulting LaserDisc copies) to be marked for dropout concealment (where-as diffDOD would correctly identify the plate error as present on all discs (and therefore not an error)).

Use the tool by specifying the available input .tbc files followed by the desired .tbc output file.

```
Options:
  -h, --help                Displays this help.
  -v, --version             Displays version information.
  -d, --debug               Show debug
  -q, --quiet               Suppress info and warning messages
  --input-json <filename>   Specify the input JSON file for the first input
                            file (default input.json)
  --output-json <filename>  Specify the output JSON file (default output.json)
  -r, --reverse             Reverse the field order to second/first (default
                            first/second)
  -t, --threads <number>    Specify the number of concurrent threads (default
                            is the number of logical CPUs)
  --no-diffdod              Do not use differential dropout detection on low
                            source pixels
  --passthrough             Pass-through dropouts present on every source

Arguments:
  inputs                    Specify input TBC files (- as first source for
                            piped input)
  output                    Specify output TBC file (omit or - for piped
                            output)
```

## ld-process-vits
This application performs an analysis of the VITS (Vertical Interval Test Signals) and recalculates the white and black SNR values in the metadata.  Note that any TBC file will already have this metadata provided by ld-decode.  This tool is generally used along with dropout correction and stacking as the video content of the TBC is modified - running ld-process-vits therefore allows you update the SNR metadata in order to analyse the result (using ld-analyse).

Use the tool by specifying the required input .tbc file.  The tool will backup the previous JSON file (to .vbup) before proceeding.

```
Options:
  -h, --help                Displays this help.
  -v, --version             Displays version information.
  -d, --debug               Show debug
  -q, --quiet               Suppress info and warning messages
  --input-json <filename>   Specify the input JSON file (default input.json)
  --output-json <filename>  Specify the output JSON file (default same as
                            input)
  -n, --nobackup            Do not create a backup of the input JSON metadata
  -t, --threads <number>    Specify the number of concurrent threads (default
                            is the number of logical CPUs)

Arguments:
  input                     Specify input TBC file
```
