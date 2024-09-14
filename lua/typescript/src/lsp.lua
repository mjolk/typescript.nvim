--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end
-- End of Lua Library inline imports
local ____exports = {}
local ____commands = require("typescript.src.commands")
local setupCommands = ____commands.setupCommands
local ____config = require("typescript.src.config")
local config = ____config.config
local ____handlers = require("typescript.src.handlers")
local renameHandler = ____handlers.renameHandler
local ____methods = require("typescript.src.types.methods")
local TypescriptMethods = ____methods.TypescriptMethods
local ____lspconfig = require("lspconfig")
local ts_ls = ____lspconfig.ts_ls
____exports.setupLsp = function(overrides)
    local resolvedConfig = __TS__ObjectAssign({}, config, overrides or ({}))
    local ____resolvedConfig_server_0 = resolvedConfig.server
    local on_init = ____resolvedConfig_server_0.on_init
    local on_attach = ____resolvedConfig_server_0.on_attach
    local handlers = ____resolvedConfig_server_0.handlers
    resolvedConfig.server.on_init = function(client, initialize_result)
        if on_init ~= nil then
            on_init(client, initialize_result)
        end
    end
    resolvedConfig.server.on_attach = function(client, bufnr)
        if not config.disable_commands then
            setupCommands(bufnr)
        end
        if on_attach ~= nil then
            on_attach(client, bufnr)
        end
    end
    resolvedConfig.server.handlers = __TS__ObjectAssign({}, handlers or ({}), {[TypescriptMethods.RENAME] = handlers and handlers[TypescriptMethods.RENAME] or renameHandler})
    ts_ls.setup(resolvedConfig.server)
end
return ____exports
