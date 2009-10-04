.onLoad <- function(lib,pkg) {
    if (Sys.getenv("NMICA_HOME")=="") {
		Sys.setenv(NMICA_HOME="~/workspace/nmica-trunk")
	}
	if (Sys.getenv("NMICA_EXTRA_HOME")=="") {
		Sys.setenv(NMICA_EXTRA_HOME="~/workspace/nmica-extra")
	}
}
