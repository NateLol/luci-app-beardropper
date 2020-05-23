module("luci.controller.bearDropper", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/bearDropper") then
	return
    end
    entry({"admin", "services", "bearDropper"}, alias("admin", "services", "bearDropper", "setting"),_("BearDropper"), 30).dependent = true
    entry({"admin", "services", "bearDropper", "status"}, call("act_status")).leaf= true
    entry({"admin", "services", "bearDropper", "setting"}, cbi("bearDropper/setting"), _("Setting"), 1)
    entry({"admin", "services", "bearDropper", "setting"}, form("bearDropper/log"), _("Log"), 1)
    --entry:
end

function act_status()
    local e={}
    e.running = luci.sys.call("pgrep -f /usr/sbin/bearDropper >/dev/null")==0
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end
