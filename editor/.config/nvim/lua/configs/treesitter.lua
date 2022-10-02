local ok, config = pcall(require, "nvim-treesitter.configs")
if (not ok) then
    return
end

config.setup {
    ensure_installed = {
        "lua",
        "rust",
        "json",
        "typescript",
        "tsx",
        "toml"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    }
}
