-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Common utilities
	  use("nvim-lua/plenary.nvim")

	  -- Icons
	  use("nvim-tree/nvim-web-devicons")

    --Colorschema
    use("rebelot/kanagawa.nvim")

    --Useful plugin to show you pending keybinds
    use({
      "folke/which-key.nvim",
      config = function()
                require("test.configs.which-key")
      end,
    })

    --StatusLine
    use({
		    "nvim-lualine/lualine.nvim",
		    event = "BufEnter",
		    config = function()
			            require("test.configs.lualine")
		            end,
		    requires = { "nvim-web-devicons" },
	  })

    -- Treesitter
	  use({
		    "nvim-treesitter/nvim-treesitter",
		    run = function()
			          require("nvim-treesitter.install").update({ with_sync = true })
		    end,
		    config = function()
			          require("test.configs.treesitter")
		    end,
	  })

    use({ "windwp/nvim-ts-autotag",
          after = "nvim-treesitter" 
    })
    
    -- Telescope
	  use({
		    "nvim-telescope/telescope.nvim",
		    tag = "0.1.8",
		    requires = { { "nvim-lua/plenary.nvim" } },
	  })
	
  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- bar
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'

    -- LSP
	  use({
		    "neovim/nvim-lspconfig",
	  })
    
    use("onsails/lspkind-nvim")

    -- LSP diagnostics, code actions, and more via Lua.
	  use({
		    "jose-elias-alvarez/null-ls.nvim",
		    config = function()
			              require("test.configs.null-ls")
		              end,
        requires = { "nvim-lua/plenary.nvim" },
	  })

  	-- Mason: Portable package manager
	  use({
		    "williamboman/mason.nvim",
		    config = function()
			            require("mason").setup()
		             end,
	  })

	  use({
		    "williamboman/mason-lspconfig.nvim",
		    config = function()
			              require("test.configs.mason-lsp")
		            end,
		    after = "mason.nvim",
	  })
    
    -- File manager
	  use({
		    "nvim-neo-tree/neo-tree.nvim",
		    branch = "v3.x",
		    requires = {
			      "nvim-lua/plenary.nvim",
			      "nvim-tree/nvim-web-devicons",
			      "MunifTanjim/nui.nvim",
		    },
	  })
    
    -- Show colors
	  use({
		    "norcalli/nvim-colorizer.lua",
		    config = function()
			              require("colorizer").setup({ "*" })
		            end,
	  })

    -- Terminal
	  use({
		    "akinsho/toggleterm.nvim",
		    tag = "*",
		    config = function()
			            require("test.configs.toggleterm")
		            end,
	  })

    -- Git
	  --use({
		--    "lewis6991/gitsigns.nvim"
	  --})

    -- Markdown Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
                vim.fn["mkdp#util#install"]()
              end,
    })

    -- autopairs
    use({
        "windwp/nvim-autopairs",
        config = function()
                    require("test.configs.autopairs")
                 end,
    })


end)
