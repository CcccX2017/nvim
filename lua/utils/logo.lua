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
}

function M.get_logo()
  local term_program = os.getenv("TERM_PROGRAM")
  if not term_program then
    for program, env_var in pairs(term_programs) do
      if os.getenv(env_var) then
        term_program = program
      end
    end
  end

  if not term_program or string.find(term_program:lower(), "iterm") then
    return iterm_logo
  end

  return other_logo
end

return M
