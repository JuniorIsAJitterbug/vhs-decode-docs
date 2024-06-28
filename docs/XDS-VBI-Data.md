---
title: XDS Data
---

This is a signalling standard used by [PBS](https://www.pbs.org/) for analogue TV Transmissions

(This needs expanding on)

PBS had an encoding box built by Soft Touch for all PBS stations to encode the time-of-day, call letters, and "network" onto line 21 field 2 (EDS/XDS info)


## Examples 


[Example Data](https://drive.google.com/open?id=1ziZq4v9w0jLAyWIbkM46dtDMW1VdPLRr)

![2006_CBC_grabber1_+cvbs 0-12-00 EP_new mov_snapshot_00 01 152](https://user-images.githubusercontent.com/56382624/218397701-0d9bd090-46a1-4495-83f2-2fc2edc6fca6.jpg)

[Video Clip](https://user-images.githubusercontent.com/56382624/218397758-1cc520be-acdf-434a-a564-c4e9d2d76ac4.mp4)


## Extracting Data 


### Tools


FFmpeg & [QCTools](https://mediaarea.net/QCTools/Download)

[CC_Decoder](https://github.com/CordySmith/cc_decoder/tree/master/bin)


### Process 


As a very hacky and manual workaround, I managed to decode the PBS time by:

1. Loading the MKV into QCTools and enabling the EIA608 filter display.
2. Manually typing the relevant XDS Time bytes into a "fake" SCC file.
3. Converting the SCC file to human-readable "Closed Caption Disassembly" format using SCC Tools' CCASDI.

Input:

```
Scenarist_SCC V1.0

00:00:01:00    0701 D543 434C 4649 8FB3

00:00:02:00    0704 6880 8FFE
```

Command: `ccasdi PBSTimeFakeSCC.scc`

Output: 

```
SCC_disassembly V1.2
CHANNEL 3

00:00:01:00    {XDS Ms TM 03:21S _SA Dec 03 1999 Fri \Cb3}
00:00:02:00    {XDS Ms TZ -16D \Cfe} 
```

"Hour in UTC (UTC is London's time zone--subtract four hours to get Eastern Time, eight hours to get Pacific Time; note that date and Day of Week are also UTC)" so I take it this is 19:21 PT on Dec 02 1999 Thu (the station is in WA).

Unfortunately the Local Time Zone field appears to be wrong. It's saying -16 daylight instead of -8 standard.  


## References 


Closed Caption Disassembly Documentation: XDS [Live](http://www.theneitherworld.com/mcpoodle/SCC_TOOLS/DOCS/CC_XDS.HTML) / [Archive](https://web.archive.org/web/20230627074532/http://www.theneitherworld.com/mcpoodle/SCC_TOOLS/DOCS/CC_XDS.HTML)

[PBS XDS Google Groups](https://web.archive.org/web/20230213063604/https://groups.google.com/g/sci.electronics/c/FAbzaGNk_Cc/m/_jqXJDz1CyMJ?pli=1%2A)

[Brad MSGoham - DD86](https://discord.com/channels/665557267189334046/687532251868823553/1066067285674037369)

https://github.com/CordySmith/cc_decoder

https://mediaarea.net/QCTools/Download


## Notes


## PBS Time and XDS

<https://discordapp.com/channels/665557267189334046/687532251868823553/1065906289173082112>

<https://discordapp.com/channels/665557267189334046/687532251868823553/1066031886159327363>

<https://discordapp.com/channels/665557267189334046/687532251868823553/1066057549037699082>

Example from drfsupercenter — 20/01/2023 18:12


    XDS Channel Station Call-Sign:
    XDS Current Scheduled Start Time: 21:00 on Day 30 of Month 09
    XDS Current Program Name: VOTE 2004 PRESIDENTIAL DEBATES
    XDS Rating: N/A
    XDS Channel Name: ABC
    XDS Channel Station Call-Sign:
    XDS Current Length of Show: 02:00 XDS Current Elapsed time: 00:02:15


<https://discordapp.com/channels/665557267189334046/687532251868823553/1066067285674037369>
