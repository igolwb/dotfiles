hl.workspace_rule({ workspace = "name:game", monitor = PRIMARY_MONITOR, default = true })
hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", persistent = true })

-- you can make a specific workspace on a monitor a diferent direction of scrolling
hl.workspace_rule({
	workspace = "1",
	layout = "scrolling",
  layout_opts = {
    direction = "right",
  },
})

hl.workspace_rule({
	workspace = "2",
	layout = "lua:grid",
})

