## ld-chroma-decoder


This application takes the output of ld-decode (a PAL or NTSC TBC file) and performs chroma decoding (i.e. colourises it).

The output is a sequence of RGB48, YUV444P16, or GRAY16 video frames suitable for piping to an external application such as FFmpeg.

Syntax:

`ld-chroma-decoder [options] <input TBC file name> [output file name]`


## Example:


TBC --> Chroma-Decoder y4m --> FFmpeg --> V210 4:2:2 Uncompressed in the QuickTime MOV contaienr.

NTSC

    ld-chroma-decoder --decoder ntsc3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v v210 -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv422p10le -color_primaries smpte170m -color_trc bt709 -colorspace smpte170m -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

PAL

    ld-chroma-decoder --decoder transform3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v v210 -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv422p10le -color_primaries bt470bg -color_trc bt709 -colorspace bt470bg -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov


## Example with full vertical VBI data:


Y4M Only.

NTSC

    ld-chroma-decoder --ffll 1 --lfll 259 --ffrl 2 --lfrl 525 --decoder ntsc3d -p y4m -q INPUT.tbc OUTPUT.mov

PAL

    ld-chroma-decoder --ffll 2 --lfll 308 --ffrl 2 --lfrl 620 --decoder transform3d -p y4m -q INPUT.tbc OUTPUT.mov


## Notes & Command Argument List


Most options have a corresponding setting in ld-analyse's 'Chroma decoder configuration' window so you can experiment with them interactively there. For more information, see the [ld-analyse manual](https://github.com/happycube/ld-decode/wiki/ld-analyse#chroma-decoder-configuration).

The `mono` filter isn't available in ld-analyse. It treats the whole signal as luma, so it's the best choice when you know that the input video doesn't contain any colour information (e.g. black-and-white films).

```
Options:
  -h, --help                                  Displays help on commandline
                                              options.
  --help-all                                  Displays help including Qt
                                              specific options.
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
  --ntsc-phase-comp                           NTSC: Adjust phase per-line using
                                              burst phase
  --simple-pal                                Transform: Use 1D UV filter
                                              (default 2D)
  --transform-threshold <number>              Transform: Uniform similarity
                                              threshold (default 0.4)
  --transform-thresholds <file>               Transform: File containing
                                              per-bin similarity thresholds
  --show-ffts                                 Transform: Overlay the input and
                                              output FFTs

Arguments:
  input                                       Specify input TBC file (- for piped input)
  output                                      Specify output file (omit or - for piped output)

```



# Manual Commands 




CVBS-Decode is the same workflow as Laserdisc's in with LD-Decode (without audio etc) using the suite of ld-tools.

`ld-chroma-decoder` is used to render the TBC to a full-colour video file you can render to y4m or pipe to FFmpeg.

The chroma-decoder can use over 20~35GB of ram if available and can run faster then real-time on fairly modern systems.
 
The decoder has lots of options that can be tweaked but the list of pre-made commands below will get you started with a good basic export with proper interlaced flagging.

Use `ld-chroma-decoder -h` to list all the options available to the decoder.

Replace `INPUT.tbc` and `OUTPUT.mkv` with your desired names.

## Note 

For standard output this list of export commands is provided you only need to change `setdar=4/3` to `setdar=16/9` for widescreen content.

## Pre-Made Command List

## Full Vertical Export (VBI Area)

Y4M Only* you can use these 2 commands. (Will be resolved with tbc-video-export later)


NTSC

    ld-chroma-decoder --ffll 1 --lfll 259 --ffrl 2 --lfrl 525 --decoder ntsc3d -p y4m -q INPUT.tbc OUTPUT.mov

PAL

    ld-chroma-decoder --ffll 2 --lfll 308 --ffrl 2 --lfrl 620 --decoder transform3d -p y4m -q INPUT.tbc OUTPUT.mov


![Example To Update Later](https://github.com/oyvindln/vhs-decode/wiki/assets/images/VITC/Ebay-NV-S7-VHS-SP-Full-Frame-Interlaced-25i-VITC-centered-crop.jpg)


## FFV1 (4:2:2) (Lossless Compressed)

NTSC

    ld-chroma-decoder --decoder ntsc3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v ffv1 -level 3 -coder 1 -context 1 -g 1 -slicecrc 1 -vf setfield=tff -flags +ilme+ildct -color_primaries smpte170m -color_trc bt709 -colorspace smpte170m -color_range tv -pix_fmt yuv422p10le -vf setdar=4/3,setfield=tff OUTPUT.mkv

PAL

    ld-chroma-decoder --decoder transform3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v ffv1 -level 3 -coder 1 -context 1 -g 1 -slicecrc 1 -vf setfield=tff -flags +ilme+ildct -color_primaries bt470bg -color_trc bt709 -colorspace bt470bg -color_range tv -pix_fmt yuv422p10le -vf setdar=4/3,setfield=tff OUTPUT.mkv


## V210 (4:2:2) (Uncompressed)

NTSC

    ld-chroma-decoder --decoder ntsc3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v v210 -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv422p10le -color_primaries smpte170m -color_trc bt709 -colorspace smpte170m -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

PAL

    ld-chroma-decoder --decoder transform3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v v210 -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv422p10le -color_primaries bt470bg -color_trc bt709 -colorspace bt470bg -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

----

## ProRes HQ (4:2:2) (Visually Lossless)

NTSC

    ld-chroma-decoder --decoder ntsc3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v prores -profile:v 3 -vendor apl0 -bits_per_mb 8000 -quant_mat hq -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv422p10le -color_primaries smpte170m -color_trc bt709 -colorspace smpte170m -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

PAL

    ld-chroma-decoder --decoder transform3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v prores -profile:v 3 -vendor apl0 -bits_per_mb 8000 -quant_mat hq -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv422p10le -color_primaries bt470bg -color_trc bt709 -colorspace bt470bg -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

## Y4M (4:4:4) (Uncompressed)

NTSC

    ld-chroma-decoder --decoder ntsc3d -p y4m -q INPUT.tbc OUTPUT.mov

PAL

    ld-chroma-decoder --decoder transform3d -p y4m -q INPUT.tbc OUTPUT.mov


## V410 (4:4:4) (Uncompressed)

NTSC

    ld-chroma-decoder --decoder ntsc3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v v410 -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv444p10le -color_primaries smpte170m -color_trc bt709 -colorspace smpte170m -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

PAL

    ld-chroma-decoder --decoder transform3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v v410 -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv444p10le -color_primaries bt470bg -color_trc bt709 -colorspace bt470bg -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

## ProRes 4444XQ (4:4:4) (Visually Lossless)


NTSC

    ld-chroma-decoder --decoder ntsc3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v prores -profile:v 5 -vendor apl0 -bits_per_mb 8000 -mbs_per_slice -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv444p10le -color_primaries smpte170m -color_trc bt709 -colorspace smpte170m -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov

PAL

    ld-chroma-decoder --decoder transform3d -p y4m -q INPUT.tbc| ffmpeg -i - -c:v prores -profile:v 5 -vendor apl0 -bits_per_mb 8000 -mbs_per_slice 8 -f mov -top 1 -vf setfield=tff -flags +ilme+ildct -pix_fmt yuv444p10le -color_primaries bt470bg -color_trc bt709 -colorspace bt470bg -color_range tv -vf setdar=4/3,setfield=tff OUTPUT.mov