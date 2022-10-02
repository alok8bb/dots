local modules = {
	"options",
	"mappings",
	"plugins"
}

for _, a in ipairs(modules) do
	local ok, _ = pcall(require, a)
	if not ok then 
		vim.notify("[err] module " .. a .. " not found!")
	end 
end
