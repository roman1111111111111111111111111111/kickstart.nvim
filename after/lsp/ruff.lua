return {
  init_options = {
    settings = {
      lint = {
        ignore = {
          'F821',
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Disable hover and other non-diagnostics capabilities to avoid conflict with Pyright
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.completionProvider = false
  end,
}
