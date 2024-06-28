---
title: Current Development State
---

Welcome to the Current State Document where current progression and performance are always noted down.

## Development Status

Decoding of RF captured media is fully working for several formats [Tape Support List](Tape-Format-Support-List.md).

Filtering just needs to be added to expand on new formats.

## Current Proformance

AMD/Intel X86 (64-bit) Based Systems are 2-3fps in WSL2 and Ubuntu 20.04 LTS however more testing is needed on current gen chips.

Apple M1 is 5fps & M1 Max Silicon is 6-7fps (NVME/RAM/CPU are all directly integrated)

## Notes

The primary bottleneck is the Time Base Correction, and resampling does induce some overhead, FLAC compressed captures while saving space also do add an 1fps bottleneck.
