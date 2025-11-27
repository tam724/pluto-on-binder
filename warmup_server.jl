@info("instantiate from setup.py")
import Pkg
Pkg.instantiate()

@info("import Pluto from setup.py")
import Pluto

@info("starting new notebook from setup.py")
sesh = Pluto.ServerSession(options=Pluto.Configuration.from_flat_kwargs(; include("pluto_server_config.jl")...))
nb = Pluto.SessionActions.new(sesh; run_async=false)
@info("shutting down notebook from setup.py")
Pluto.SessionActions.shutdown(sesh, nb; async=false)


notebook_url = "https://raw.githubusercontent.com/tam724/test_pluto_binder/refs/heads/main/notebook.jl"
@info("starting notebook $(notebook_url) from setup.py")
nb2 = Pluto.SessionActions.open_url(sesh, notebook_url; run_async=false)
@info("shutting down notebook from setup.py")
Pluto.SessionActions.shutdown(sesh, nb2; async=false)

# @info("$(versioninfo())")

# @info("instantiating notebook environment");
# Pkg.activate("./notebook_environment/")
# Pkg.instantiate()

@info("setup.py done");

