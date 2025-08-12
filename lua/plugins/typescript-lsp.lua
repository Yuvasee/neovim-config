return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative",
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
              },
              updateImportsOnFileMove = {
                enabled = "always"
              },
            },
            javascript = {
              preferences = {
                importModuleSpecifier = "non-relative",
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
              },
            },
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
          },
          -- Ensure vtsls respects tsconfig.json path mappings
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git")(fname)
          end,
        },
      },
    },
  },
}