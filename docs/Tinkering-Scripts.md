---
title: Tinkering Scripts 
---

These are not 100% approved workflow scripts but ones that do have or are a work in progress.


## ld-tools scripts 


`ld-process-vbi.bat`

``````
:: Scan for and index VBI data inside Luma TBC file and update .JSON file.
echo Decoding VBI Data...
"ld-process-vbi.exe" "%~1"
echo Done. 
PAUSE
``````

`ld-dropout-correct.bat`

``````
:: Dropout Correct Luma Channel TBC file
echo Correcting Luma TBC Video Frame Data...
"ld-dropout-correct.exe" "%~1" "%~n1_Dropout-Corrected.tbc"
echo Done. 
PAUSE
``````


## Gen Chroma For Windows


Save into text file and rename to `.bat` i.e `gen_chroma_xxx.bat`

The `_vbi` ones have the full vertical commands passed though.


### `gen_chroma_ntsc.bat`


``````
chcp 65001
echo Configuration of the chroma decoder
echo
echo Available decoder : (PAL: pal2d, transform2d, transform3d / NTSC: ntsc1d, ntsc2d, ntsc3d, ntsc3dnoadapt)
SET /p decoder=Chroma Decoder :
SET /p luma-nr=Luminance Noise Reduction (0) :
SET /p chroma-nr=Chrominance Noise Reduction (0) : 
SET /p chroma-gain=Chrominance Gain (1.0) : 
SET /p chroma-phase=Chrominance Phase (0) :
SET /p audiofile=Path to audio file (can be empty) :
echo
echo Ready to start
pause

if [%decoder%] == [] set decoder=pal2d
if [%luma-nr%] == [] set luma-nr=0
if [%chroma-nr%] == [] set chroma-nr=0
if [%chroma-gain%] == [] set chroma-gain=1
if [%chroma-phase%] == [] set chroma-phase=0

SET /p decoder=Select a decoder :
SET /p luma-nr=luma-nr (0) :
SET /p chroma-nr=chroma-nr (0) : 
SET /p chroma-gain=chroma-gain (1.0) : 
SET /p chroma-phase=chroma-phase (0) :
SET /p audiofile=Path to audio file (can be empty) :

if exist "%~dp1%~n1.wav" set audiofile= -i "%audiofile%"
if not exist "%~dp1%~n1.wav" set audiofile= 

set name=%~n1
set name=%name:"=%
set lumafile=0
set chromafile=0

if "%name:~-7%" EQU "_chroma" set chromafile="%~dp1%~n1.tbc"
if %chromafile% NEQ 0 set lumafile="%~dp1%name:_chroma=%.tbc"
if %chromafile% EQU 0 set lumafile="%~dp1%~n1.tbc"
if %chromafile% EQU 0 set chromafile="%~dp1%~n1_chroma.tbc"

if "%decoder%" EQU "ntsc1d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc2d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3dnoadapt" set ntsc-phase-comp=--ntsc-phase-comp

set lumafile=%lumafile:"=%
set chromafile=%chromafile:"=%

title Decoding : %~n1   Decoder : ntsc3d --ntsc-phase-comp   Luma-nr : %luma-nr%   Chroma-nr : %chroma-nr%   Chroma-gain : %chroma-gain%   Chroma-phase : %chroma-phase%
ld-chroma-decoder.exe "%lumafile%" --input-json "%lumafile%.json" -f mono --luma-nr %luma-nr% --chroma-nr 0 --chroma-gain 1 --chroma-phase 1 -p y4m | ffmpeg -r 29.97 -y -i - -pix_fmt y8 -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 "%lumafile%_bw.mkv"
ld-chroma-decoder.exe "%chromafile%" --input-json "%lumafile%.json" -f %decoder% %ntsc-phase-comp% --luma-nr 0 --chroma-nr %chroma-nr% --chroma-gain %chroma-gain% --chroma-phase %chroma-phase% -p y4m | ffmpeg -y -i "%lumafile%_bw.mkv" -i - %audiofile% -filter_complex "[0]format=pix_fmts=yuv444p,extractplanes=y[y]; [1]format=pix_fmts=yuv444p,extractplanes=u+v[u][v]; [y][u][v]mergeplanes=0x001020:yuv444p,format=pix_fmts=yuv422p" -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 -top 1 -c:a flac -compression_level 11 "%lumafile%.mkv"
echo end of the script
pause
``````


### `gen_chroma_ntsc_vbi.bat`



``````
chcp 65001
echo Configuration of the chroma decoder
echo
echo Available decoder : (PAL: pal2d, transform2d, transform3d / NTSC: ntsc1d, ntsc2d, ntsc3d, ntsc3dnoadapt)
SET /p decoder=Chroma Decoder :
SET /p luma-nr=Luminance Noise Reduction (0) :
SET /p chroma-nr=Chrominance Noise Reduction (0) : 
SET /p chroma-gain=Chrominance Gain (1.0) : 
SET /p chroma-phase=Chrominance Phase (0) :
SET /p audiofile=Path to audio file (can be empty) :
echo
echo Ready to start
pause

if [%decoder%] == [] set decoder=pal2d
if [%luma-nr%] == [] set luma-nr=0
if [%chroma-nr%] == [] set chroma-nr=0
if [%chroma-gain%] == [] set chroma-gain=1
if [%chroma-phase%] == [] set chroma-phase=0

SET /p decoder=Select a decoder :
SET /p luma-nr=luma-nr (0) :
SET /p chroma-nr=chroma-nr (0) : 
SET /p chroma-gain=chroma-gain (1.0) : 
SET /p chroma-phase=chroma-phase (0) :
SET /p audiofile=Path to audio file (can be empty) :

if exist "%~dp1%~n1.wav" set audiofile= -i "%audiofile%"
if not exist "%~dp1%~n1.wav" set audiofile= 

set name=%~n1
set name=%name:"=%
set lumafile=0
set chromafile=0

if "%name:~-7%" EQU "_chroma" set chromafile="%~dp1%~n1.tbc"
if %chromafile% NEQ 0 set lumafile="%~dp1%name:_chroma=%.tbc"
if %chromafile% EQU 0 set lumafile="%~dp1%~n1.tbc"
if %chromafile% EQU 0 set chromafile="%~dp1%~n1_chroma.tbc"

if "%decoder%" EQU "ntsc1d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc2d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3dnoadapt" set ntsc-phase-comp=--ntsc-phase-comp

set lumafile=%lumafile:"=%
set chromafile=%chromafile:"=%

title Decoding : %~n1   Decoder : ntsc3d --ntsc-phase-comp   Luma-nr : %luma-nr%   Chroma-nr : %chroma-nr%   Chroma-gain : %chroma-gain%   Chroma-phase : %chroma-phase%
ld-chroma-decoder.exe "%lumafile%" --ffll 1 --lfll 259 --ffrl 2 --lfrl 525 --input-json "%lumafile%.json" -f mono --luma-nr %luma-nr% --chroma-nr 0 --chroma-gain 1 --chroma-phase 1 -p y4m | ffmpeg -r 29.97 -y -i - -pix_fmt y8 -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 "%lumafile%_bw.mkv"
ld-chroma-decoder.exe "%chromafile%" --ffll 1 --lfll 259 --ffrl 2 --lfrl 525 --input-json "%lumafile%.json" -f %decoder% %ntsc-phase-comp% --luma-nr 0 --chroma-nr %chroma-nr% --chroma-gain %chroma-gain% --chroma-phase %chroma-phase% -p y4m | ffmpeg -y -i "%lumafile%_bw.mkv" -i - %audiofile% -filter_complex "[0]format=pix_fmts=yuv444p,extractplanes=y[y]; [1]format=pix_fmts=yuv444p,extractplanes=u+v[u][v]; [y][u][v]mergeplanes=0x001020:yuv444p,format=pix_fmts=yuv422p" -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 -top 1 -c:a flac -compression_level 11 "%lumafile%.mkv"
echo end of the script
pause
``````


### `gen_chroma_pal.bat



``````
chcp 65001
echo Configuration of the chroma decoder
echo
echo Available decoder : (PAL: pal2d, transform2d, transform3d / NTSC: ntsc1d, ntsc2d, ntsc3d, ntsc3dnoadapt)
SET /p decoder=Chroma Decoder :
SET /p luma-nr=Luminance Noise Reduction (0) :
SET /p chroma-nr=Chrominance Noise Reduction (0) : 
SET /p chroma-gain=Chrominance Gain (1.0) : 
SET /p chroma-phase=Chrominance Phase (0) :
SET /p audiofile=Path to audio file (can be empty) :
echo
echo Ready to start
pause

if [%decoder%] == [] set decoder=pal2d
if [%luma-nr%] == [] set luma-nr=0
if [%chroma-nr%] == [] set chroma-nr=0
if [%chroma-gain%] == [] set chroma-gain=1
if [%chroma-phase%] == [] set chroma-phase=0

SET /p decoder=Select a decoder :
SET /p luma-nr=luma-nr (0) :
SET /p chroma-nr=chroma-nr (0) : 
SET /p chroma-gain=chroma-gain (1.0) : 
SET /p chroma-phase=chroma-phase (0) :
SET /p audiofile=Path to audio file (can be empty) :

if exist "%~dp1%~n1.wav" set audiofile= -i "%audiofile%"
if not exist "%~dp1%~n1.wav" set audiofile= 

set name=%~n1
set name=%name:"=%
set lumafile=0
set chromafile=0

if "%name:~-7%" EQU "_chroma" set chromafile="%~dp1%~n1.tbc"
if %chromafile% NEQ 0 set lumafile="%~dp1%name:_chroma=%.tbc"
if %chromafile% EQU 0 set lumafile="%~dp1%~n1.tbc"
if %chromafile% EQU 0 set chromafile="%~dp1%~n1_chroma.tbc"

if "%decoder%" EQU "ntsc1d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc2d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3dnoadapt" set ntsc-phase-comp=--ntsc-phase-comp

set lumafile=%lumafile:"=%
set chromafile=%chromafile:"=%

title Decoding : %~n1   Decoder : ntsc3d --ntsc-phase-comp   Luma-nr : %luma-nr%   Chroma-nr : %chroma-nr%   Chroma-gain : %chroma-gain%   Chroma-phase : %chroma-phase%
ld-chroma-decoder.exe "%lumafile%" --input-json "%lumafile%.json" -f mono --luma-nr %luma-nr% --chroma-nr 0 --chroma-gain 1 --chroma-phase 1 -p y4m | ffmpeg -r 25 -y -i - -pix_fmt y8 -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 "%lumafile%_bw.mkv"
ld-chroma-decoder.exe "%chromafile%" --input-json "%lumafile%.json" -f %decoder% %ntsc-phase-comp% --luma-nr 0 --chroma-nr %chroma-nr% --chroma-gain %chroma-gain% --chroma-phase %chroma-phase% -p y4m | ffmpeg -y -i "%lumafile%_bw.mkv" -i - %audiofile% -filter_complex "[0]format=pix_fmts=yuv444p,extractplanes=y[y]; [1]format=pix_fmts=yuv444p,extractplanes=u+v[u][v]; [y][u][v]mergeplanes=0x001020:yuv444p,format=pix_fmts=yuv422p" -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 -top 1 -c:a flac -compression_level 11 "%lumafile%.mkv"
echo end of the script
pause
``````


### `gen_chroma_pal_vbi.bat`


``````
chcp 65001
echo Configuration of the chroma decoder
echo
echo Available decoder : (PAL: pal2d, transform2d, transform3d / NTSC: ntsc1d, ntsc2d, ntsc3d, ntsc3dnoadapt)
SET /p decoder=Chroma Decoder :
SET /p luma-nr=Luminance Noise Reduction (0) :
SET /p chroma-nr=Chrominance Noise Reduction (0) : 
SET /p chroma-gain=Chrominance Gain (1.0) : 
SET /p chroma-phase=Chrominance Phase (0) :
SET /p audiofile=Path to audio file (can be empty) :
echo
echo Ready to start
pause

if [%decoder%] == [] set decoder=pal2d
if [%luma-nr%] == [] set luma-nr=0
if [%chroma-nr%] == [] set chroma-nr=0
if [%chroma-gain%] == [] set chroma-gain=1
if [%chroma-phase%] == [] set chroma-phase=0

SET /p decoder=Select a decoder :
SET /p luma-nr=luma-nr (0) :
SET /p chroma-nr=chroma-nr (0) : 
SET /p chroma-gain=chroma-gain (1.0) : 
SET /p chroma-phase=chroma-phase (0) :
SET /p audiofile=Path to audio file (can be empty) :

if exist "%~dp1%~n1.wav" set audiofile= -i "%audiofile%"
if not exist "%~dp1%~n1.wav" set audiofile= 

set name=%~n1
set name=%name:"=%
set lumafile=0
set chromafile=0

if "%name:~-7%" EQU "_chroma" set chromafile="%~dp1%~n1.tbc"
if %chromafile% NEQ 0 set lumafile="%~dp1%name:_chroma=%.tbc"
if %chromafile% EQU 0 set lumafile="%~dp1%~n1.tbc"
if %chromafile% EQU 0 set chromafile="%~dp1%~n1_chroma.tbc"

if "%decoder%" EQU "ntsc1d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc2d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3d" set ntsc-phase-comp=--ntsc-phase-comp
if "%decoder%" EQU "ntsc3dnoadapt" set ntsc-phase-comp=--ntsc-phase-comp

set lumafile=%lumafile:"=%
set chromafile=%chromafile:"=%

title Decoding : %~n1 Decoder : ntsc3d --ntsc-phase-comp   Luma-nr : %luma-nr%   Chroma-nr : %chroma-nr%   Chroma-gain : %chroma-gain%   Chroma-phase : %chroma-phase%
ld-chroma-decoder.exe "%lumafile%" --ffll 2 --lfll 308 --ffrl 2 --lfrl 620  --input-json "%lumafile%.json" -f mono --luma-nr %luma-nr% --chroma-nr 0 --chroma-gain 1 --chroma-phase 1 -p y4m | ffmpeg -r 25 -y -i - -pix_fmt y8 -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 "%lumafile%_bw.mkv"
ld-chroma-decoder.exe "%chromafile%" --ffll 2 --lfll 308 --ffrl 2 --lfrl 620 --input-json "%lumafile%.json" -f %decoder% %ntsc-phase-comp% --luma-nr 0 --chroma-nr %chroma-nr% --chroma-gain %chroma-gain% --chroma-phase %chroma-phase% -p y4m | ffmpeg -y -i "%lumafile%_bw.mkv" -i - %audiofile% -filter_complex "[0]format=pix_fmts=yuv444p,extractplanes=y[y]; [1]format=pix_fmts=yuv444p,extractplanes=u+v[u][v]; [y][u][v]mergeplanes=0x001020:yuv444p,format=pix_fmts=yuv422p" -c:v ffv1 -coder 1 -context 0 -level 3 -slices 4 -slicecrc 0 -pass 1 -top 1 -c:a flac -compression_level 11 "%lumafile%.mkv"
echo end of the script
pause
``````
