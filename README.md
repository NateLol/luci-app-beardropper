luci-app-beardropper
===

[Preview][preview]
---
luci-app-beardropper, a log examination script w/ iptables firewall rule generation response.
 
 This is the LuCI app built for the elegant firewall rule generation on-the-fly script [bearDropepr][bearDropper], only a few modifications were made to work with Luci.
 

 
Targets/Devices
---
Written in shell scripts, so it shall work all good on all devices.


Config
---
The config file path is: `/etc/config/bearDropper`  and this is the CUI configuration format.

Compile
---
1. Make your own local feeds, say a folder `openwrt/yourfeeds`

2. Clone master under feeds to have `openwrt/yourefeeds/luci-app-beardropper`

3. Append  `src-link /path/to/openwrt/yourfeeds` `openwrt/feeds.conf(.default)`  

4. Run following scripts under `openwrt`:

```bash
# Update feeds
./scripts/feeds update -a
./scripts/feeds install -a

# M select luci-app-beardropper in LuCI -> 3. Applications also 2. Modules->Translations if you want translations together
make menuconfig
# compile
make package/feeds/luci-app-beardropper/compile V=99
```


Logs
---
`2020-05-21` Added a new tab listing the blocked IPs.


 [preview]: https://github.com/natelol/luci-app-beardropper/tree/master/preview
 [bearDropper]: https://github.com/robzr/bearDropper