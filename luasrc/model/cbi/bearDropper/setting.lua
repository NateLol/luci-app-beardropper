require("luci.sys")
require("luci.sys.zoneinfo")
require("luci.tools.webadmin")
--require("luci.fs")
require("luci.config")

m = Map("bearDropper", translate("bearDropper"), translate("bearDropper, 是一款能够在开启公网访问之后对潜在的ssh attack进行防御的脚本"))
m:chain("luci")

m:section(SimpleSection).template="bearDropper/status"

s = m:section(TypedSection, "bearDropper", translate(""))
s.anonymous = true
s.addremove = false

-- TABS 
s:tab("options", translate("运行选项"))

o = s:taboption("options", Flag, "enabled",translate("启用"))
o.default = 0

-- OPTIONS
o = s:taboption("options", ListValue, "defaultMode", translate("运行模式"))
o.default = "follow"
o:value("follow", translate("后台监控"))
o:value("entire", translate("已有记录"))
o:value("today", translate("仅今日"))
o:value("wipe", translate("清除所有"))


o = s:taboption("options", Value, "attemptCount", "最大尝试登录次数", "failure attempts from a given IP required to trigger a ban")

o = s:taboption("options", Value, "attemptPeriod", "尝试登录时间段", "time period during which attemptCount must be exceeded in order to trigger a ban")

o = s:taboption("options", Value, "banLength", "封禁IP时长", "how long a ban exist once the attempt threshold is exceeded")

o = s:taboption("options", ListValue, "logLevel", "日志等级")
o.default = "1"
o:value("0", translate("slient"))
o:value("1", translate("default"))
o:value("2", translate("verbose"))
o:value("3", translate("debug"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/bearDropper restart")
end

return m
