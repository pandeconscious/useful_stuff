# Ubuntu 16.04 setup on macbook pro 7,1 (mid 2010 model)

### Overview

This is essentially my compilation and paraphrasing of all the resources that I found online which were useful in setting up Ubuntu (specifically 16.04 although other versions should also work) on my mid 2010 macbook pro 7,1. Since it is a bit tricky and there are various pitfalls such as graphics card driver issues and WiFi driver issues, I need this information at one place.

### Steps

1. [Make bootable USB with Ubuntu](#make-bootable-usb-with-ubuntu)
2. [Install Ubuntu on macbook](#Install-Ubuntu-on-macbook)
3. [Change nouveau to nvidia drivers](#Change-nouveau-to-nvidia-drivers)
4. [Make pci config changes](#Make-pci-config-changes)
5. [Install WiFi drivers](#Install-WiFi-drivers)


#### Make bootable USB with Ubuntu
Just make a bootable USB with Ubuntu. Follow an official link such as [this one](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-macos#0). This is the most straightforward step.

#### Install Ubuntu on macbook
Shutdown the macbook if it is already not. Insert the USB. Start the macbook with option/alt button pressed. This will show you an option to boot from USB via EFI option. You can select that and install Ubuntu.

#### Change nouveau to nvidia drivers
**This is a critical step, without which GUI won't worl properly**. When Ubuntu is installed using the previous step, usually everything works fine till the login screen and after login the UI doesn't  behave properly. By default the nouveau graphics drivers are installed, which don't wort that well and also heatup the system. Acutally after this step hating issues have come down sginificantly.  

##### Check which drivers are in use. I followed this [link](https://askubuntu.com/questions/271613/am-i-using-the-nouveau-driver-or-the-proprietary-nvidia-driver). One way it to use:
```
dpkg -l | grep -i nvidia
lsmod | grep nouveau

```
Another way is
```
sudo apt install inxi
inxi -Gx
```


#### Make pci config changes

#### Install WiFi drivers
