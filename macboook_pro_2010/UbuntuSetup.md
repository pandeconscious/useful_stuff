# Ubuntu 16.04 setup on macbook pro 7,1 (mid 2010 model)

### Overview

This is essentially my compilation and paraphrasing of all the resources that I found online which were useful in setting up Ubuntu (specifically 16.04 although other versions should also work) on my mid 2010 macbook pro 7,1. Since it is a bit tricky and there are various pitfalls such as graphics card driver issues and WiFi driver issues, I need this information at one place.

### Steps

1. [Make bootable USB with Ubuntu](#make-bootable-usb-with-ubuntu)
2. [Install Ubuntu on macbook](#Install-Ubuntu-on-macbook)
3. [Change nouveau to nvidia drivers](#Change-nouveau-to-nvidia-drivers)
4. [Make pci config changes](#Make-pci-config-changes)
5. [Install WiFi drivers](#Install-WiFi-drivers)
6. [Enable brightness control](#Enable-brightness-control)


#### Make bootable USB with Ubuntu
Just make a bootable USB with Ubuntu. Follow an official link such as [this one](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-macos#0). This is the most straightforward step.

#### Install Ubuntu on macbook
Shutdown the macbook if it is already not. Connect a live ethernet cable for the internet connectivity because WiFi won't work by default. Insert the USB. Start the macbook with option/alt button pressed. This will show you an option to boot from USB via EFI option. You can select that and install Ubuntu.

#### Change nouveau to nvidia drivers
**This is a critical step, without which GUI won't worl properly**. When Ubuntu is installed using the previous step, usually everything works fine till the login screen and after login the UI doesn't  behave properly. By default the nouveau graphics drivers are installed, which don't wort that well and also heatup the system. Acutally after this step hating issues have come down sginificantly.  

##### Check which drivers are in use. 
I followed this [link](https://askubuntu.com/questions/271613/am-i-using-the-nouveau-driver-or-the-proprietary-nvidia-driver). One way it to use:
```
dpkg -l | grep -i nvidia
lsmod | grep nouveau

```
Another way is
```
sudo apt install inxi
inxi -Gx
```

By default nouveau drivers should be running. For this machine nvidia-331 drivers are needed for optimal graphics rendering and in the next step we will just install that.

##### Install nvidia drivers
I followed this [link](https://tech.amikelive.com/node-731/how-to-properly-install-nvidia-graphics-driver-on-ubuntu-16-04/).In step 8 I used nvidia-331 instead of 390, rest is same.
```
sudo apt-get install nvidia-331
```

#### Make pci config changes
**This is also a very critical step, essentially right PCi bus identifiers need to be mapped**. I followed the steps 2 and 3 of [this solution](https://askubuntu.com/questions/264247/proprietary-nvidia-drivers-with-efi-on-mac-to-prevent-overheating/613573#613573) and rebooted the system. Don't make mistake here. After reboot screen shows NIVIDIA, which indicates that now nvidia drivers are in use.

#### Install WiFi drivers
For installing WiFi drivers I followed the [link](https://askubuntu.com/a/60395). In summary the following was done:
```
sudo apt install bcmwl-kernel-source
```

#### Enable brightness control
I followed the Enabling brightness controls section in [this link]<http://korrekt.org/page/Note:How_to_install_(K)Ubuntu_14.04_on_Macbook_7,1#Installing_Kubuntu>
