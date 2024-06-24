# ld-ldf-reader


ld-ldf-reader is a streaming decompressor for `.ldf` files that can jump to a specific location in the file.  

It is very lightly modified ffmpeg library sample code and is mostly used by ld-decode to support seamless seeking inside .ldf files, therefore it only outputs via standard output.

!!! NOTE
  This program only exists because of an ffmpeg CLI program bug preventing seeking deep into a file, so it is now being slowly phased out.

Usage: 

    ld-ldf-reader infile [seek location] | (consumer)


# ld-cut


ld-cut is a utility for cutting samples from raw RF LaserDisc captures (useful to create samples of trouble-areas when issue reporting), and can now also be used to compress .lds files.  The utility allows you to seek and specify start and end frames similar to the main ld-decode application.

```
usage: ld-cut [-h] [-s start] [-l length] [-S seek] [-E end] [-p] [-n]
              infile outfile

Extract a sample area from raw RF laserdisc captures. (Similar to ld-decode,
except it outputs samples)

positional arguments:
  infile                source file
  outfile               destination file (recommended to use .lds or .ldf suffixes)

optional arguments:
  -h, --help            show this help message and exit
  -s start, --start start
                        rough jump to frame n of capture (default is 0)
  -l length, --length length
                        limit length to n frames
  -S seek, --seek seek  seek to frame n of capture
  -E end, --end end     cutting: last frame
  -p, --pal             source is in PAL format
  -n, --ntsc            source is in NTSC format
```

Using ld-cut, you can do parallel .ldf encodings (optionally targeting different directories) using shell scripting pretty easily:

```
for i in f1.lds f2.lds f3.lds f4.lds; do (ld-cut $i /someotherdirectory/`basename -s .lds $i`.ldf &); done
```


# ld-compress


ld-compress is a bash script to simplify the compression of `.lds` 40msps 10-bit packed DdD RF Captures into `.ldf` files.

ld-decode fully supports FLAC compressed files as input.  Files can be suffixed with .ldf as shown here, or .raw.oga.  ld-decode will automatically uncompress the input file during processing.

To compress a .lds file simply use:

```
ld-compress <filename>.lds
```

Or drag and drop on the `ld-compress.bat` or `ld-compress-nvidia-gpu.bat`

This script will write a .ldf compressed version of the .lds file to the directory it's called from.


### Enabling GPU acceleration for ld-compress


ld-compress also supports GPU acceleration via [FlaLDF](https://github.com/TokugawaHeavyIndustries/FlaLDF).  This requires an OpenCL compatible GPU and installation of FlaLDF.

[Download FlaLDF](https://github.com/TokugawaHeavyIndustries/FlaLDF/releases/latest).  Linux users, install using the .deb.  If you're on Mac, add FlaLDF to your PATH.

To compress an .lds file with GPU acceleration, use:

```
ld-compress -a <filename>.lds
```
Flaccl does not presently support ogg file containers, so the the output will be with the file extension of .flac.ldf to distinguish from traditionally compressed captures.


The full list of command line options is as follows:

```
Usage: /usr/local/bin/ld-compress [-c] [-a] [-u] [-v] [-p] [-h] [-l <1-12>] [-g] file(s)

Modes:

`-c` Compress (default): Takes one or more .lds files and compresses them to .ldf files in the current directory.
`-u` Uncompress: Takes one or more .ldf/.raw.oga files and uncompresses them to .lds files in the current directory.
`-a` GPU Acceleration.  Uses OpenCL or CUDA to accelerate encoding. See https://github.com/happycube/ld-decode/wiki/ld-decode-utilities
`-v` Verify: Returns md5 checksums of the given .ldf/.raw.oga files and their contained .lds files for verification purposes.

Options:

`-p` Progress: displays progress bars - requires pv to be installed.
`-h` Help: This dialog.
`-l` Compression level 1 - 12 (1 - 11 for GPU encoding). Default is 11 (10 for GPU). 6 is recommended for faster but fair compression.
`-g` Use .raw.oga extension instead of .ldf when compressing.
```

# Page End