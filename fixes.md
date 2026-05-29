1. Detailed Summary of Fixes Applied
   Here’s the complete step-by-step journey that resolved your long resume freezes and improved power usage on your ThinkPad P1 Gen 7 (Intel Ultra 9 185H + RTX 4070) running Fedora 44 with niri.
   Initial Problems

Long freezes (30 seconds → 5 minutes) on resume after extended suspend.
High idle power (~20W) with fans spinning.

Final Working Configuration

Kernel: 7.0.10-201.fc44
Intel GPU: Xe driver (instead of i915)
NVIDIA: Driver 595.71.05 with NVreg_DynamicPowerManagement=0x03
mem_sleep_default=s2idle
NVIDIA power services enabled

Step-by-Step Fixes Applied

Fixed NVIDIA Driver Loading
Removed corrupted modprobe configs.
Corrected NVreg_DynamicPowerManagement=0x02 (was using invalid ON value).
Rebuilt with akmods --force --rebuild && dracut -f.

Switched Intel Graphics to Xe Driver (Major improvement)Bashsudo grubby --update-kernel=ALL --args="i915.force_probe=!7d55 xe.force_probe=7d55"
Enabled NVIDIA Power Management ServicesBashsudo systemctl enable --now nvidia-suspend.service nvidia-resume.service nvidia-hibernate.service
Changed Suspend Mode to s2idle (Very important for hybrid graphics)Bashsudo grubby --update-kernel=ALL --args="mem_sleep_default=s2idle"
Optimized NVIDIA Power Setting
Final setting: NVreg_DynamicPowerManagement=0x03
Added NVreg_PreserveVideoMemoryAllocations=1

Cleaned up kernel command line
Removed old/broken parameters (i915.enable_psr=0, i915.enable_dc=0, garbage text, etc.).

Result: Overnight suspend now wakes instantly. Idle power dropped to ~9.7W on battery with fans off.
