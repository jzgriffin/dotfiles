-- Load plugins first
require("config.lazy")

require("config.diagnostic")
require("config.lsp")
require("config.mappings")
require("config.options")
require("config.ui2")

-- Load user/init.lua if it exists
pcall(require, "user.init")
