local function command(name, callback, options)
	local final_opts = vim.tbl_deep_extend("force", options or {}, { bang = true })
	vim.api.nvim_create_user_command(name, callback, final_opts)
end

local cpr = require("CompetitiveProgramRunner")

command("CompetitiveProgramGen", function(args)
	cpr:Gen(args.fargs[1])
end, { nargs = 1 })
command("CompetitiveProgramBuild", function()
	cpr.Build()
end)
command("CompetitiveProgramRun", function()
	cpr.Run()
end)
command("CompetitiveProgramBuildAndRun", function()
	cpr.BuildAndRun()
end)
