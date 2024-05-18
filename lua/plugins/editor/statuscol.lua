--
local M = {
    'luukvbaal/statuscol.nvim',
    version = false,
    lazy = true,
    event = {"BufReadPre", "BufNewFile"}
}

M.opts = function()
    local builtin = require("statuscol.builtin")
return {
    relculright = true,
    segments = {
    {
        sign = { name = { "Dap" }, maxwidth = 1, colwidth=1, auto = true },
        click = "v:lua.ScSa"
    },
    {
        sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth=2, auto = false },
        click = "v:lua.ScSa"
    },
    {
        text = { builtin.lnumfunc, " "}, click = "v:lua.ScLa",
    },
    {
        sign = { namespace = {"gitsigns"}, name = {".*"}, maxwidth = 1, colwidth = 1, auto = true },
        click = "v:lua.ScSa",
    },
    }
}
end

M.config = function(_, opts)
    require("statuscol").setup(opts)
  end

return M
