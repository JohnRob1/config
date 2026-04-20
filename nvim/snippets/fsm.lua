local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

-- Function to get appropriate comment style based on filetype
local function get_comment_style()
  local ft = vim.bo.filetype
  -- Define comment styles for different filetypes
  local comment_styles = {
    -- Block comment styles
    c = { "/*", "*/" },
    cpp = { "/*", "*/" },
    java = { "/*", "*/" },
    javascript = { "/*", "*/" },
    typescript = { "/*", "*/" },
    php = { "/*", "*/" },
    
    -- Line comment styles
    python = { "# ", "" },
    sh = { "# ", "" },
    bash = { "# ", "" },
    zsh = { "# ", "" },
    lua = { "-- ", "" },
    sql = { "-- ", "" },
    vim = { '" ', "" }, -- Vimscript uses double quotes for comments
    
    -- Default fallback
    default = { "# ", "" },
  }
  
  return comment_styles[ft] or comment_styles.default
end

return {
  s("fsm", {
    f(function(args)
      local comment_style = get_comment_style()
      local open = comment_style[1]
      local close = comment_style[2]
      
      local init = i(1, "InitialState")
      local state = i(2, "State")
      
      local mermaid_lines = {
        "stateDiagram-v2",
        "[*] --> " .. init,
        init .. " --> " .. state,
        state .. " --> [*]",
      }
      
      local mermaid_code = table.concat(mermaid_lines, "\n")
      
      if close ~= "" then
        -- Block comment style
        return table.concat({
          open,
          "",
          mermaid_code,
          "",
          close,
        }, "\n")
      else
        -- Line comment style
        local prefixed_lines = {}
        for line in vim.gsplit(mermaid_code, "\n") do
          table.insert(prefixed_lines, open .. line)
        end
        return table.concat(prefixed_lines, "\n")
      end
    end, {}),
  }),
}