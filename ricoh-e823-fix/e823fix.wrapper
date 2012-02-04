#!/bin/bash
rmmod sdhci_pci
rmmod sdhci
setpci -v -d 1180:e823 f9.B=fc
setpci -v -d 1180:e823 150.B=10
setpci -v -d 1180:e823 f9.B=00
setpci -v -d 1180:e823 fc.B=01
setpci -v -d 1180:e823 e1.B=32
setpci -v -d 1180:e823 fc.B=00
modprobe sdhci
modprobe sdhci_pci
