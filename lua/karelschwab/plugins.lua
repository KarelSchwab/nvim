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

        -- Lualine
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }

        use {
            "VonHeikemen/lsp-zero.nvim",
            requires = {
                -- LSP Support
                {"neovim/nvim-lspconfig"},
                {"williamboman/mason.nvim"},
                {"williamboman/mason-lspconfig.nvim"},
                -- Autocompletion
                {"hrsh7th/nvim-cmp"},
                {"hrsh7th/cmp-buffer"},
                {"hrsh7th/cmp-path"},
                {"hrsh7th/cmp-cmdline"},
                {"saadparwaiz1/cmp_luasnip"},
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-nvim-lua"},
                -- Snippets
                {"L3MON4D3/LuaSnip"},
                {"rafamadriz/friendly-snippets"}
            }
        }

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
    end
)
