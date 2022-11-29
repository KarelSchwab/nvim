vim.api.nvim_create_autocmd("BufReadPost" , {
    command = [[set filetype=astro]],
    pattern = "*.astro"
})
