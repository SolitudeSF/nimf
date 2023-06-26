version     = "0.1.0"
author      = "Gruruya"
description = "Text finder"
license     = "AGPL-3.0-only"

srcDir = "src"
skipDirs = @["tests"]
namedBin["nimf"] = "f"

# Dependencies
requires "nim >= 1.9.3"
requires "malebolgia"
requires "cligen >= 1.6.6 & < 2.0.0"
requires "adix >= 0.5.5"

taskRequires "test", "https://github.com/disruptek/balls >= 3.0.0"

task test, "run tests":
  let balls =
    when defined(windows):
          "balls.cmd"
    else: "balls"
  exec balls & " --backend:c --mm:arc --mm:refc --define:danger"
