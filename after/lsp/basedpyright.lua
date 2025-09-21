return {
  settings = {
    basedpyright = {
      analysis = {
        ignorePatterns = { '*.pyi' },
        diagnosticSeverityOverrides = {
          reportCallIssue = 'warning',
          reportUnreachable = 'warning',
          reportUnusedImport = 'none',
          reportUnusedCoroutine = 'warning',
        },
        -- diagnosticMode = "workspace",
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'basic',
        disableOrganizeImports = true,
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = true
    client.server_capabilities.document_formatting = false
  end,
}
