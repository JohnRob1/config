local dap = require 'dap'

dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'Wavelogix - .NET',
    request = 'launch',
    program = vim.fn.expand '~/Developer/Wavelogix/rebel-dashboard-api/WAVELOGIX/bin/Debug/net9.0/WAVELOGIX.dll',
    args = {},
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    console = 'internalConsole',
    env = {
      ASPNETCORE_ENVIRONMENT = 'Development',
      ASPNETCORE_URLS = 'https://localhost:44350;http://localhost:44351',
    },
    sourceFileMap = {
      ['/Views'] = '${workspaceFolder}/Views',
    },
  },
}

dap.configurations.typescript = {
  {
    type = 'firefox',
    name = 'Wavelogix - Angular',
    request = 'launch',
    url = 'http://localhost:4200',
    webRoot = '${workspaceFolder}',
    reAttach = true,
  },
}

return {}
