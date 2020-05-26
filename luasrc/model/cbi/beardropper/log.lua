f = SimpleForm("logview")
f.reset = false
f.submit = false
t = f:field(TextValue, "conf")
t.rmempty = true
t.rows = 40
function t.cfgvalue()
local logs = luci.util.execi("if [ -f /tmp/beardropper.log ];then cat /tmp/beardropper.log; else touch /tmp/beardropper.log; fi")
local s = ""
for line in logs do
s = line .. "\n" .. s
end
return s
end
t.readonly="readonly"

return f
