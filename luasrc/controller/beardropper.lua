module("luci.controller.beardropper", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/beardropper") then
	return
    end
    entry({"admin", "services", "beardropper"}, alias("admin", "services", "beardropper", "setting"),_("BearDropper"), 30).dependent = true
    entry({"admin", "services", "beardropper", "status"}, call("act_status")).leaf= true
    entry({"admin", "services", "beardropper", "setting"}, cbi("beardropper/setting"), _(""), 1)
    --entry:
end

function act_status()
    local e={}
    e.running = luci.sys.call("pgrep -f /usr/sbin/beardropper >/dev/null")==0
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end