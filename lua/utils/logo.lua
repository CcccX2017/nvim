local M = {}

local other_logo = {
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
}

local iterm_logo = {
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                                                              ]],
  [[  ███╗   ██╗███████╗██████╗ ██╗   ██╗██╗      █████╗ ██╗   ██╗██╗███╗   ███╗  ]],
  [[  ████╗  ██║██╔════╝██╔══██╗██║   ██║██║     ██╔══██╗██║   ██║██║████╗ ████║  ]],
  [[  ██╔██╗ ██║█████╗  ██████╔╝██║   ██║██║     ███████║██║   ██║██║██╔████╔██║  ]],
  [[  ██║╚██╗██║██╔══╝  ██╔══██╗██║   ██║██║     ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
  [[  ██║ ╚████║███████╗██████╔╝╚██████╔╝███████╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
  [[  ╚═╝  ╚═══╝╚══════╝╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                                                              ]],
}

local term_programs = {
  konsole = "KONSOLE_DBUS_SESSION",
  kitty = "KITTY_PID",
  alacritty = "TERM",
  xterm = "TERM",
}

local function detect_terminal()
  local term_program = os.getenv("TERM_PROGRAM")
  if term_program then
    return term_program:lower()
  end

  for program, env_var in pairs(term_programs) do
    local env = os.getenv(env_var)
    if env then
      if env_var == "TERM" then
        if string.match(env:lower(), program:lower()) then
          return program
        end
      else
        return program
      end
    end
  end
  return "unknown"
end

function M.get_logo()
  local term_program = detect_terminal()

  if term_program == "unknown" or string.find(term_program:lower(), "iterm") then
    return iterm_logo
  end

  return other_logo
end

return M
