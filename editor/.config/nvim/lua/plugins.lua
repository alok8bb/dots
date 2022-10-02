local ok, _ = pcall(require, 'packer')
if not ok then 
    vim.notify('[err] packer not found!')
    return
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function ()
    use 'wbthomason/packer.nvim'

    use { "ellisonleao/gruvbox.nvim" }

    use { "folke/tokyonight.nvim" }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function ()
            require "configs.treesitter"
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function ()
            require 'configs.telescope'
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function ()
            require 'configs.lualine'
        end
    }
end)
