-- This file is a symlink target from the module tree.
-- Works for any GOLD version so long as the module and install dir are named like the 2018 version.

help([[GOLD (Genetic Optimisation for Ligand Docking) is a genetic algorithm for docking flexible
ligands into protein binding sites. GOLD has been extensively tested and has shown excellent
performance for pose prediction and good results for virtual screening. - Homepage: https://www.ccdc.cam.ac.uk/solutions/csd-discovery/Components/Gold/]])
whatis([[Name: GOLD]])
whatis([[Description: A genetic algorithm for docking flexible ligands into protein binding sites]])
whatis([[Homepage: https://www.ccdc.cam.ac.uk/solutions/csd-discovery/Components/Gold/]])

conflict("GOLD")

local version = myModuleVersion():gsub('%.', '')
local root = '/opt/nesi/mahuika/GOLD'

local gold_root = root .. '/GoldSuite_' .. version
local csd_root = root .. '/CSD_' .. version

-- CSD variables before GOLD variables, since we're using prepend_path
setenv("CSDHOME", csd_root)
prepend_path("PATH", pathJoin(csd_root, "bin"))

setenv("GOLD_DIR", pathJoin(gold_root, "GOLD"))
prepend_path("PATH", pathJoin(gold_root, "bin"))
prepend_path("PATH", pathJoin(gold_root, "GOLD", "bin"))
