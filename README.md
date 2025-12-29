# MusicPlayer-DAC
Projeto Desenvolvido no ano de 2025 (Em Progresso)

Reprodutor de música digital de alta fidelidade.

## Overview

High-fidelity digital music player based on Volumio, designed to deliver clean, low-noise audio
through a custom hardware and software integration.

## Features

- High-fidelity digital music player based on Volumio
- 4-inch TFT color display showing:
  - Album artwork
  - Album name, artist and track title
  - Playback progress bar
- Auxiliary white OLED display showing:
  - Track time
  - Current player status (Play, Pause, Stop)
- Infrared (IR) remote control for:
  - Playback control
  - Menu navigation
  - System interaction


## Key Differentiator – Power Supply Design

Unlike standard Raspberry Pi audio players that rely on switching power supplies,
this project uses a fully custom-designed linear power supply optimized for
high-fidelity audio applications.

- AC input protected by an EFI filter for EMI suppression
- Transformer with dual 9V secondary outputs
- Two independent and isolated 5V power rails:
  - One dedicated exclusively to the Raspberry Pi
  - One dedicated exclusively to the DAC
- Each rail includes:
  - Pi-filter
  - Low-noise 5V LDO regulator
  - 10,000 µF capacitor bank
  - Hand-wound 3-layer inductor on E-core
- Zero measurable ripple verified using oscilloscope measurements
