-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

client_scripts {

  "configurations.lua",
  "cl_lastpos.lua",

}

server_scripts {

  "@mysql-async/lib/MySQL.lua", -- Load mysql-async
  "configurations.lua",
  "sv_lastpos.lua",

}

exports {

}

server_exports {

}
