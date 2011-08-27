Description:
  
 * runit-services is a package which provides services for common daemons for use with runit. (http://smarden.org/runit)
 
Usage:

 * This package places all the services in /etc/sv.  You can enable each service by doing the folowing:
    ln -s /etc/sv/<service> /service
 * An example for sshd:
    ln -s /etc/sv/sshd /service
 * We'll try to maintain name compatibility with the services provided by the existing BSD-style init scripts in
  Archlinux.

Support:
  
 * You can find Death_Syn or bougyman in #archlinux on freenode.


