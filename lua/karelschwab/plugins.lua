require("packer").startup(
    function(use)
        -- Plugin manager
        use "wbthomason/packer.nvim"

        -- Gruvbox color scheme
        use "gruvbox-community/gruvbox"

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/plenary.nvim"}}
        }

        -- Telescope FZF plugin
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

        -- Telescope icons
        use "kyazdani42/nvim-web-devicons"

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "nvim-treesitter/nvim-treesitter-context"

        -- LSP
        use "neovim/nvim-lspconfig"

        -- Lualine
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }

        -- LuaSnip
        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"

        -- CMP
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "saadparwaiz1/cmp_luasnip"

        -- Mason
        use {"williamboman/mason.nvim"}
        use {"williamboman/mason-lspconfig.nvim"}

        -- Copilot
        use "github/copilot.vim"

        -- Comment
        use "numToStr/Comment.nvim"

        -- GitGutter
        use "airblade/vim-gitgutter"

        -- Harpoon (for extra coconut oil)
        use "ThePrimeagen/harpoon"

        -- Vim-fugitive
        use "tpope/vim-fugitive"

        -- Formatter
        use "mhartington/formatter.nvim"

        -- Blankline
        use "lukas-reineke/indent-blankline.nvim"

        -- Lspsaga
        use "onsails/lspkind.nvim"

        -- Markdown preview
        use(
            {
                "iamcco/markdown-preview.nvim",
                run = "cd app && npm install",
                setup = function()
                    vim.g.mkdp_filetypes = {"markdown"}
                end,
                ft = {"markdown"}
            }
        )

        -- undotree
        use "mbbill/undotree"

        -- Java Language Server
        use "mfussenegger/nvim-jdtls"
    end
)
