# TBC To Analouge

The TBC format is in simple terms a lossless digital file version of Composite & S-Video.

These files can be played via the software ld-analyse, or encoded to colour video files via ld-chroma-decoder.

But with these and a DAC (digital to analogue converter) they can be played back to devices with analouge inputs.

## FL2000 (FL2K) Method

![](assets/images/Hardware/FL2K-Blue-Sony-ILCE-6000-2023.02.23-00.23.31.jpg){: style="width:px"}

VGA to BNC Breakout Adapter

![](assets/images/Hardware/VGA-To-BNC-Sony-ILCE-6000-2023.02.23-00.30.03.jpg){: style="width:px"}

VG to RCA Breakout Adapter

![](assets/images/Hardware/#FIXME){: style="width:px"}

## Limitations 


FL2K does not output a fully compliant signal level (0.6~0.7vpp vs 1vpp) so while a VCR or Modern TV, or timebase corrector won't care too much a CRT won't like the signal directly or just will give a black-and-white image though the most stable signals are from `ld-decode` produced TBC files in terms of playback of colour images.

## Note 

When the signal reaches end of file currently it will lose sync and repeat the last frame untill stopped.

### LaserDisc Playback

(EWF_live_90_PILP-2005_CLV_NTSC_side1_music_2022-05-08_13-54-20)

CRT (Sony PVM)

![](assets/images/Gifs/LazerDisc-CVBS-CRT-FL2K-Sony-PVM.gif){: style="width:px"}

TV (JVC LCD)

![](assets/images/Gifs/LazerDisc-CVBS-CRT-FL2K-JVC-TV.gif){: style="width:px"}

### VHS Playback

(Munday-Walking-Around-Garden_2022-09-08_01-15-22)

CRT (Sony PVM)

![](assets/images/Gifs/VHS-CVBS-CRT-FL2K-Sony-PVM.gif){: style="width:px"}

TV (JVC LCD)

![](assets/images/Gifs/VHS-CVBS-CRT-FL2K-JVC-TV.gif){: style="width:px"}


## Playing Back to Analogue Via FL2K 

Today there is one current method to take that digital file to a composite RF signal using the cheep [FL2000 based adapters](https://osmocom.org/projects/osmo-fl2k/wiki/Osmo-fl2k)

Currently, the only method of doing this is via fl2000 (fl2k) usb3.0 chips which can easily be used in software like GNU radio to output over the RED signal pin allowing pretty much plug-and-play with breakout adapters.

FL2K - [Aliexpress Global](https://aliexpress.com/item/4000700389933.html?) & [Reichelt Europe](https://www.reichelt.com/de/fr/adaptateur-usb-3-0-vers-vga-logilink--logilink-ua0231-p163843.html)

USB To VGA Adapter Amazon Links [UK](https://www.amazon.co.uk/BENFEI-Adapter-1080P-Female-Converter/dp/B085KX97QG/) / [USA](https://www.amazon.com/BENFEI-USB-Adapter-Male-Female/dp/B085KX97QG/)

VGA to RCA Breakout Amazon Links [UK](https://www.amazon.co.uk/Ex-Pro%C2%AE-Gold-Phono-Component-Cable/dp/B008AX8U60) / [USA](https://www.amazon.com/Digital-Analog-Adapter-Display-Converter/dp/B082RB74K4/)


## Y+C to CVBS 

Colour-Under Tapes produce a Y + C or S-Video set of TBC files, these can be converted to a signal CVBS baseband file with yc2cvbs.

`yc2cvbs.exe -l Vhs.tbc -c Vhs_chroma.tbc -s p | ffmpeg -f rawvideo -pix_fmt y16 -video_size 1135x626 -i - -f rawvideo -c:v rawvideo Vhs_combined.tbc`

There is also the YUV to YCbCR tool - All inside the [Vrunk Toolkit](https://github.com/vrunk11/vrunk_toolkit)

## TBC to FL2K player (Linux & Windows)

FL2K to S-Video/Composite

By [vrunk11](https://github.com/vrunk11/) - (vrunk11 on DD86 Discord [DD86 Discord](https://discord.com/invite/pVVrrxd)) 

Currently a work in progress, later to be a drag and drop easy to work with the player on Windows/Linux.

Currently, this is only a command-line tool. 

[Offical Github Fork](https://github.com/vrunk11/fl2k_2)

## GNU Radio Method (Linux & Windows)

By [Tony Andersan](https://github.com/tandersn) - (9954tony on [DD86 Discord](https://discord.com/invite/pVVrrxd)) 

Example Video's [PAL](https://www.youtube.com/watch?v=MPpJ179-ZC4) / [NTSC](https://www.youtube.com/watch?v=4cjxmLpXbyE)

[GNU Script & Instructions](https://github.com/tandersn/GNRC-Flowgraphs/tree/main/tbc_via_fl2k)


FL2K Docs:

https://gitlab.hamburg.ccc.de/MarBle/fl2k-liberation

https://osmocom.org/projects/osmo-fl2k/wiki#USB-30-to-HDMI-Dongles