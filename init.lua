local start_time = vim.loop.hrtime()  -- Get the start time (in nanoseconds)

require("mg.core")
require("mg.lazy")

local loading_time = math.floor((vim.loop.hrtime() - start_time) / 1e6 + 0.5)
print("Startup Time: " .. loading_time .. "ms ⏳")
