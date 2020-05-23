module("luci.controller.beardropper", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/beardropper") then
	return
    end
    entry({"admin", "services", "beardropper"}, alias("admin", "services", "beardropper", "setting"),_("BearDropper"), 30).dependent = true
    entry({"admin", "services", "beardropper", "status"}, call("act_status")).leaf= true
    entry({"admin", "services", "beardropper", "setting"}, cbi("beardropper/setting"), _("Setting"), 1)
    entry({"admin", "services", "beardropper", "log"}, form("beardropper/log"),_("Log"),2)
    --entry:
end

function act_status()
    local e={}
    e.running = luci.sys.call("pgrep -f /usr/sbin/beardropper >/dev/null")==0
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end