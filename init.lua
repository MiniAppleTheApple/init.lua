vim.filetype.add({ extension = { templ = "templ" } })

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

require("config.lazy")
require("current-theme")
