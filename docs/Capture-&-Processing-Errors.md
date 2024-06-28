---
title: Capture & Processing Errors
---

This page details information about what can cause errors such as dropped samples during capture, handling or processing of FM RF signals.


## Missing & Dropped Samples

Reasons and things to check:

- CX chip overheating caused by overclocking with crystal mod.

Solution: Heatsync + Fan (40mm)


## Storage Media hiccups:


Slow write capabilities
Such as slow interfaces i.e. USB 2.0


Hardware write buffer size and settings (cache off/on),


Software write buffer size and settings (sync/async),

Saving to network shares/devices,
Using SMR HDD (never use that crap, especially for continuous writes like RF captures!)


Using Seagate low end drives.

Using QLC SSD (such flash storage slows down significantly after writing several gigabytes),



Using HDD with slow/bad sectors (S.M.A.R.T. errors),
Fragmentation,

Free space pre-allocation (might be useful),

Writing to NTFS on Linux,
NTFS compression is on,
Storage encryption,
Storage overheating.

## System hiccups:
  
Heavy workload during recording,

Running other software that uses the same storage used for capturing,
Temporary deadlock,

CPU overheating/throttling - If its over 60c its not a good sign. 

Trying to compress the RF stream in real time with a single-threaded stream compressor like FLAC. 
