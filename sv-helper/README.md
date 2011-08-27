This is a small helper for archlinux (could be modified for others) to add the
following sv/runit helpers:

    * sv-enable) sv-enable <service> - Enable a service and start it (will restart on boots)
    * sv-disable) sv-disable <service> - Disable a service from starting (also stop the service)
    * svls) svls [<service>] - Show list of services (Default: all services, pass a service name to see just one)
    * sv-find) sv-find <service> - Find a service, if it exists
    * sv-list) sv-list - List available services
