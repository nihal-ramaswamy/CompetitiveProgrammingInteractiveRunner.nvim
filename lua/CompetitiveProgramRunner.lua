local M = {}

local deep_extend = vim.tbl_deep_extend

---@class CprOptions
---@field fileExtension string
---@field template string
---@field build string
---@field run string
---@field gen string

---@type CprOptions
local default_config = {
	fileExtension = "cpp",
	template = "template.cpp",
	build = "g++ -std=c++17 -O2 -Wall -Wshadow ${file}.${fileExtension} -o ${file}",
	run = "./${file} < ",
	gen = "cp",
}

---@type CprOptions
local local_config = deep_extend("keep", default_config, {})

---Generates a file with the name `filename`
---@param filename string
function M:Gen(filename)
	local gen = local_config.gen .. " " .. local_config.template .. " " .. filename .. "." .. local_config.fileExtension
	print(gen)

	local handle = io.popen(gen)
	if handle == nil then
		error("Could not generate")
	end
	local result = handle:read("*a")
	print(result)
	handle:close()
end

function Build() end

function Run() end

function BuildAndRun() end

return M
