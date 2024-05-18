M = {
    "williamboman/mason.nvim",
    lazy=false,
}

M.opts = {
    PATH = "append",
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
    }
}

return M