# gold-functions

GOLD is protein-ligand docking software developed and maintained by
the Cambridge Crystallographic Data Centre (CCDC) in the United
Kingdom. Its web page can be found here:

https://www.ccdc.cam.ac.uk/solutions/csd-discovery/Components/Gold/

The GOLD software itself is proprietary and closed-source, but is
licensed by several research groups at universities and other
organisations around the world. Some users of GOLD at New Zealand
institutions wish to run the software on the NeSI high-performance
computers.

In particular, researchers wish to be able to spread out the work
to dock large numbers of ligands (thousands or more) over several
CPU cores by means of Slurm array jobs. Because of the way the
software receives its input data (e.g. ligand molecules in one
large file containing many records), we need to be able to detect
certain properties.

The gold-functions package contains a single Bash (Bourne Again
SHell) resource file consisting of several functions. When this
resource file is loaded in a Slurm job submission script, these
functions are made available to the script.

The functions are as follows, listed in alphabetical order:

* check_job_status_daemon - a function that obviously existed in
  earlier (now lost) copies of the gold-functions resource file.
  GOLD communicates with its licence server by means of daemons,
  and in some cases it can be necessary to ensure that a daemon
  has shut down properly.
* clean_up_and_exit - do any necessary cleaning up and exit with
  the supplied exit code. By convention, the writer of the Slurm
  script should supply 0 if the script has exited cleanly, or a
  non-zero exit code if the exit has been triggered by an error
  condition.
* exit_trap - a function that is called by a trap in the Slurm job
  submission script. The trap exists to intercept signals caught
  by the Slurm job.
* get_library_file - parse the GOLD configuration file, looking for
  a library file containing ligand structures. If the entry exists
  in the configuration file, parse it to get the name of the
  library file.
* ligands_total - find the total number of ligands in a file, based
  solely on record separators. The function assumes a valid MDL
  SDF file or Tripos Mol2 file. 
