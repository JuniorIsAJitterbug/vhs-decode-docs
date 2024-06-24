## The Internet Archive 


The Internet archive is a massive archival library hosted across the world, mostly backing up webpages and assets.

Example: [Dialog 2001 Archive](https://archive.org/details/dialog-2001-vhs-capture)



## Proper Wording 


An FM RF archive, needs to have a few basic things to be easily indexed and discoverable.

- Capture hardware used.
- VCR & Tap setup used.
- TV System & Tape Format.
- Command used to decode the FFV1 archive provided.
- Version of decode used at the time. (build version for Windows, Commit version for MacOS/Linux)



# Making an Archive


### Basics


- A `cover.png` will set the cover art for the archive.
- Use the x264_web export to make a basic preview file from tbc-video-export.
- FLAC compressed audio is playable so that can be un-touched.


### Contents 


- FM RF Data (FLAC Compressed)
- FFV1 8-bit 4:2:2 Video Files
- Notes file on commands used and post processing if any
- Label/Cover scans in TIFF or PNG lossless


## Stopping Derivatives


The site will automatically try to waste space and create `derivatives` low quality mp3/mp4 files of what it thinks is audio and video we do not want this, as it wastes there space and users time who want to download the archive.

To kill this problem simply do the following:

Create a file called:

`_rules.conf`

Containing Inside of it:

`CAT.ALL`

Save file inside your archive folder, if you upload this to older archives this will remove the derivatives already generated.

[Derivatives IA Doc](https://archive.org/help/derivatives.php)


# Uploading Your Archive 


Once you have organised your files locally and all your assets are in order you can upload your archive.

- [Web Upload](https://archive.org/create/)
- [CLI Tool Upload](https://archive.org/developers/internetarchive/cli.html#upload)
- [Torrent Upload](https://help.archive.org/help/archive-bittorrents/#:~:text=Starting%20in%202011%2C%20the%20Internet,are%20available%20for%20the%20Torrent.)


## Web

Web Upload is drag & drop via there site, slow and quite unreliable at times.


## CLI

CLI Upload is using there command line tool. (will make a expanded writeup on it later)


## Torrent

Torrent upload is ware you create a page for your item and then upload a torrent i.g `my-archive.torrent` you have created with your files locally, this will allow slow but reliable upload and verification and allows you to also directly host and share the archive via the P2P bit torrent protocol. 

You can create a torrent with [qBittorrent](https://www.qbittorrent.org/download) or any full featured client software.

Be sure to use the trackers below [you can also add other trackers](https://github.com/ngosang/trackerslist).

``````````````
bt1.archive.org
bt2.archive.org
http://bt1.archive.org:6969/announce
http://bt2.archive.org:6969/announce
``````````````
