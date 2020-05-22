luci-app-beardropper
===

[Preview][preview]
---
luci-app-beardropper, a log examination script w/ iptables firewall rule generation response.
 
 This is the LuCI app built for the elegant firewall rule generation on-the-fly script [bearDropepr][bearDropper], only a few modifications were made to work with Luci.
 

 Package file structure:

```
├── etc/
│   ├── config/
│   │   └── bearDropper                            // UCI config file
│   │── init.d/
│   │   └── bearDropper                            // init script
│   └── uci-defaults/
│       └── luci-beardropper                       // uci-defaults script
└── usr/
    ├── sbin/
    │   └── ssr-rules                               // rule generation script
    └── lib/
        └── lua/
            └── luci/                               // LuCI part
                ├── controller/
                │   └── bearDropper.lua             // LuCI Menu
                ├── i18n/                           // LuCI language
                │   └── bearDropper.zh-cn.lmo
                └── model/
                    ├── cbi/
                    |   └── bearDropper/
                    |       └── setting.lua         // LuCI setting
                    |      
                    └── view/
                        └── bearDropper/
                            └── status.htm         // LuCI status
```

Config
---
The config file path is: `/etc/config/bearDropper`  and this is the CUI configuration format.

Compile
---
```bash
cd OpenWrt
# Clone 项目
git clone https://github.com/natelol/luci-app-beardropper.git package/feeds/luci-app-beardropper
# compile po2lmo (skip if already exists)
pushd package/feeds/luci-app-beardropper/tools/po2lmo
make && sudo make install
popd
# M select luci-app-beardropper in LuCI -> 3. Applications
make menuconfig
# compile
make package/feeds/luci-app-beardropper/compile V=99
```


Logs
---
`2020-05-21` Added a new tab listing the blocked IPs.


 [preview]: https://github.com/chenhw2/luci-app-beardropper/tree/master/preview
 [bearDropper]: https://github.com/robzr/bearDropper