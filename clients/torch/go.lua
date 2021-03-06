--
-- A convenience script, that automatically starts up a server, and
-- opens up a browser window
--

-- require gfx client
gfx = require 'gfx.js'

-- env port?
port = os.getenv('PORT')

-- initialize context / server
gfx.startserver(port)

-- open up browser
gfx.show()
