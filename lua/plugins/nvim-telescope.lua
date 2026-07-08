return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
        { '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Telescope live grep' },
        { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Telescope buffers' },
        { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Telescope help tags' },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                'node_modules/',
                '%.git/',
                'dist/',
                'build/',
                '%.next/',
                '%.cache/',
            },
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = true,
            },
            live_grep = {
                additional_args = function()
                    return { '--hidden', '--no-ignore' }
                end,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('fzf')
    end,
}
