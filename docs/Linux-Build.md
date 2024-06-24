# Linux Installation 


The [README](https://github.com/oyvindln/vhs-decode#readme) in the main GitHub repository will always be kept up-to-date for current builds and basic user guide help.

[Linux Compatibility Doc](https://docs.google.com/document/d/132ycIMMNvdKvrNZSzbckXVEPQVLTnH_YX0Oh3lqtkkQ)


## Downloads


Self Contained Binary's: [Linux x86](https://github.com/oyvindln/vhs-decode/releases/)

!!! NOTE
    AppImage files need read/write and self execution permissions.

To give the AppImage permissions open terminal in the directory and use:

    chmod +x decode.AppImage tbc-tools.AppImage 

!!! TIP
    If the files are not named the above just rename them before running the command, all 3 binary packages should be in the same decode folder. 


## Binary Usage 


Open a terminal and use the following commands :

Workflow assumes you have the decoder/tools/export in the same folder and at least FFmpeg installed systemwide this normally should be under `User/Home/decode`.

Run `./decode.AppImage` with `vhs`, `ld`, `cvbs`, `hifi` at the start.

Example: `./decode.AppImage vhs` calls vhs-decode, commands are universal.

Run `./tbc-tools.AppImage` like any normal GUI app to open ld-analyse, the `ld-xxxx` tools are used just like Linux via CLI but within the decode folder.

Run `./tbc-video-export --appimage tbc-tools.AppImage` for 100% self contained use (requires FFmpeg installed system wide)


# Manual Building 


This is the workflow to manually build the decoders and toolchain.

The vhs-decode repository also has [hifi-decode](HiFi-Decode.md), [cvbs-decode](CVBS-Composite-Decode.md) & [ld-decode](https://github.com/happycube/ld-decode) included.


## Install all dependencies

    sudo apt install clang python3-setuptools python3-numpy python3-scipy python3-matplotlib git qt5-default libqwt-qt5-dev libfftw3-dev python3-tk python3-numba libavformat-dev libavcodec-dev libavutil-dev ffmpeg openssl pv python3-setuptools make cython3 cmake pipx

For Ubuntu 22.04 that is:

    sudo apt install git qtbase5-dev libqwt-qt5-dev libfftw3-dev libavformat-dev libavcodec-dev libavutil-dev ffmpeg pv pkg-config make cmake pipx

Set up pipx

    pipx ensurepath

(Alternatively, a [python virtual environment](https://docs.python.org/3/library/venv.html) can be used instead of using pipx)

Install TBC-Video-Export

    pipx install tbc-video-export

(There is also [self contained builds](https://github.com/JuniorIsAJitterbug/tbc-video-export/releases) if install issues arise)

Optional dependencies for GPU (Nvidia Cards) FLAC compression support:

    sudo apt install make ocl-icd-opencl-dev mono-runtime

Also Requires FlaLDF [Download & Install via .deb for Linux](https://github.com/TokugawaHeavyIndustries/FlaLDF/releases/tag/v0.1b).

!!! NOTE
    Debian/ubuntu does not have a qt6 version of qwt in repositories as of yet so you have to inform the build script to use Qt5 if both qt5 and qt6 are installed with `-DUSE_QT_VERSION=5` as it might otherwise try to compile with qt6 instead and failing to locate qwt. The option is otherwise not needed.


!!! NOTE
    HiFi-Decode preview function - the python library sounddevice requires portaudio (libportaudio2 on ubuntu) this is not included in the self contained binaries and has to be installed locally if not already installed. (included with most desktop environments)

When installing from source, if you want the gui you have `hifi_gui` and `hifi_gui_qt6`

QT5

    pipx install vhs_decode[hifi_gui]

QT6

    pipx install .[hifi_gui_qt6]


## Build VHS-Decode & LD-Tools Suite


Download VHS-Decode:

    git clone https://github.com/oyvindln/vhs-decode.git vhs-decode

Install VHS-Decode:

    cd vhs-decode

Build and install vhs-decode via pipx

    pipx install .[hifi_gui_qt6]

Compile and Install ld-tools suite: (Required)

    mkdir build2
    cd build2
    cmake .. -DCMAKE_BUILD_TYPE=Release -DUSE_QT_VERSION=5
    make -j4
    sudo make install
   

Go back to the main directory with 

    cd .. 


## Updating


To update the decoders and tools do `git pull` while inside of the vhs-decode directory, and repeat the above build & compile steps. 

Binary versions, there is no automatic updates simply check back on the [releases](https://github.com/oyvindln/vhs-decode/releases) page from time to time.


## Legacy Building


Older builds may have use for testing or understanding, deprecated or older revisions of functions.

Between 2021-2024 there was 2 notable turning points in the building process.

Pre-Pipx switchover

Pre-Cmake switchover


# Page End


Previous Page [Home](index.md)