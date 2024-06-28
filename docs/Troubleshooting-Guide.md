---
title: Troubleshooting Guide
---

List of common and semi common issues and questions you would be asked if you have said issues. 

- Have you read the wiki properly not just skimmed it?
- Can you use Google or the wiki?
- `CTRL + F` is your friend.


## Hardware

- Is the tape playing? (No Tape = No Signal)
- Is the cable plugged in?
- Is the cable broken?
- Are connectors clean?
- Is the video heads clean?
- Is the power supply in good condition? (no bulging capacitors)


## Capture Hardware 


- Is there a powerful RF or EMI device such as a microwave next to the capture setup?
- Is the gain level set too low or too high?
- Is the signal centred? (CX Card users [Test CXADC](https://github.com/tandersn/GNRC-Flowgraphs/tree/main/test_cxadc))
- Is there issues with deck power? (external amplifiers using internal PSU taps may need a 5v LDO)


## Software 


- Did you set tape media format and tv system?
- Did you set TV system (such as PAL for UK tapes and NTSC for USA tapes)
- Is secure boot enabled? (breaks a lot with Linux!)
- Did you forget you have to state decoder you wish to use for binaries?


## RF Taps 


- Is any metal, dirt, hair on test point / jig or hook-up point?
- Do you have grounding on your cables at both ends? (i.g on BNC and near test point)
- Did you make a cold solder joint? (if so remove wires clean off with fresh flux and copper braid)
- Do you have good 60/40 leaded solder and flux?
- Do you know what is signal and what is ground? (centre pin is signal everything else is isolator or ground on a BNC or SMA connector)


## Blackmagic Issues


Blackmagic is a wonderful, if you like cheep kit that's built to half die (and be half to 90% off on eBay!) as a lot of users will use Blackmagic hardware for reference capture it was worth adding this segment here.

They use standard ADV chips like everyone else, just poor reliability.

There mini converters have 2 major flaws

- Grounding (There is non unless SDI is connected first.) 
- ESD Protection (There ports die A LOT)
- Lack of power filtering (Requires a clean and very stable DC 12.1v to 12.8v power supply)
- Lack of TBC/3D comb being enabled (issue applies to all there hardware)
