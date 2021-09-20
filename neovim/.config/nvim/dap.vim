command! DAPContinue lua require'dap'.continue()
command! DAPToggleBreakpoint lua require'dap'.toggle_breakpoint()
command! DAPStepInto lua require'dap'.step_into()
command! DAPStepOver lua require'dap'.step_over()
command! DAPStepOut lua require'dap'.step_out()
command! DAPConditionalBreakpoint lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
command! DAPLogBreakpoint lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))

